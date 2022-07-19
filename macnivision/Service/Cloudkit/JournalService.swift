//
//  JournalService.swift
//  macnivision
//
//  Created by renaka agusta on 13/07/22.
//

import Foundation
import CloudKit

class JournalService {
    static let shared: JournalService = {
        return JournalService()
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
    
    func addJournal(complete: @escaping (_ instance: String?, _ error: NSError?) -> (), journal: Journal){
        for _ in 0...2{
            let record = CKRecord(recordType: "Journal")
            
            let dateFormatter = DateFormatter()
            
            record["userId"] = journal.userId
            record["entryDate"] = dateFormatter.string(from: journal.entryDate)
            record["emotion"] = journal.emotion
            record["note"] = journal.note
            record["diary"] = journal.diary
            
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
        
    }
    
    func fetchJournals(complete: @escaping (_ instance: [Journal]?, _ error: NSError?) -> ()){
        let pred = NSPredicate(value: true)
        let query = CKQuery(recordType: "Journal", predicate: pred)
        defaultContainer.publicCloudDatabase.perform(query, inZoneWith: nil) {[self] results, error in
            if let error = error {
                self.errorHandler(error: error)
                complete(nil,error as NSError)
            } else if let checkedResults = results {
                let journals = self.parseJournalResults(records: checkedResults)
                complete(journals, nil)
            }
        }
    }
    
    private func parseJournalResults(records: [CKRecord]) -> [Journal]{
        var journals = [Journal]()
        
        var index = 0
        records.forEach { (record) in
            
            let id = index
            let recordId = record.recordID.recordName
            let userId = record["userId"]
            let entryDate = record["entryDate"]
            let diary = record["diary"]
            let note = record["note"]
            let emotion = record["emotion"]

            let dateFormatter = ISO8601DateFormatter()
            
            journals.append(Journal(
                id: index,
                recordId: recordId,
                userId: userId as! String,
                entryDate: dateFormatter.date(from:entryDate as! String)!,
                diary: diary as! String,
                note: note as! String,
                emotion: emotion as! [String]
            ))
            
            index = index + 1
        }
        
        return journals
    }
    
    private func errorHandler(error: Error) {
        print("CloudKit Message :: ",error.localizedDescription)
    }
}
