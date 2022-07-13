//
//  UserService.swift
//  macnivision
//
//  Created by renaka agusta on 13/07/22.
//

import Foundation
import CloudKit

class UserService {
    static let shared: UserService = {
        return UserService()
    }()
    
    var recordID:CKRecord.ID?
    private var defaultContainer = CKContainer(identifier: "iCloud.macnivision"){
        didSet {
            self.defaultContainer.fetchUserRecordID { (recordID, error) -> Void in
                if let responseError = error {
                    self.errorHandler(error: responseError)
                } else if let userRecordID = recordID {
                    self.recordID = userRecordID
                }
            }
        }
    }
    
    func addUser(complete: @escaping (_ instance: String?, _ error: NSError?) -> (), user: User){
        let record = CKRecord(recordType: "User")
            
        record["nickname"] = user.nickname

        let publicData = defaultContainer.publicCloudDatabase
        publicData.save(record) { (record:CKRecord?, error:Error?) in
             if error == nil{
                 complete("success", nil)
             } else {
                self.errorHandler(error: error as! Error)
                complete(nil,error as? NSError)
             }
        }
    }
    
    func fetchUsers(complete: @escaping (_ instance: [User]?, _ error: NSError?) -> ()){
        let pred = NSPredicate(value: true)
        let query = CKQuery(recordType: "User", predicate: pred)
        defaultContainer.publicCloudDatabase.perform(query, inZoneWith: nil) {[self] results, error in
            if let error = error {
                self.errorHandler(error: error)
                complete(nil,error as NSError)
            } else if let checkedResults = results {
                let users = self.parseUserResults(records: checkedResults)
                complete(users, nil)
            }
        }
    }
    
    private func parseUserResults(records: [CKRecord]) -> [User]{
        var users = [User]()
        
        var index = 0
        records.forEach { (record) in
            
            let id = index
            let recordId = record.recordID.recordName
            let nickname = record["nickname"]
            
            users.append(User(
                id: index,
                recordId: recordId,
                nickname: nickname as! String
            ))
            
            index = index + 1
        }
        
        return users
    }
    
    private func errorHandler(error: Error) {
        print("CloudKit Message :: ",error.localizedDescription)
    }
}
