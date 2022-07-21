//
//  PetService.swift
//  macnivision
//
//  Created by renaka agusta on 13/07/22.
//

import Foundation
import CloudKit

class PetService {
    static let shared: PetService = {
        return PetService()
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
    
    func addPet(complete: @escaping (_ instance: String?, _ error: NSError?) -> (), pet: Pet){
        for _ in 0...2{
            let record = CKRecord(recordType: "Pet")
            
            record["userId"] = pet.userId
            record["hungryLevel"] = pet.hungryLevel
            record["foodAmount"] = pet.foodAmount
            record["typePet"] = pet.typePet == Pet.TypePet.dog ? "dog" : "cat"

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
    
    func fetchPets(complete: @escaping (_ instance: [Pet]?, _ error: NSError?) -> ()){
        let pred = NSPredicate(value: true)
        let query = CKQuery(recordType: "Pet", predicate: pred)
        defaultContainer.publicCloudDatabase.perform(query, inZoneWith: nil) {[self] results, error in
            if let error = error {
                self.errorHandler(error: error)
                complete(nil,error as NSError)
            } else if let checkedResults = results {
                let pets = self.parsePetResults(records: checkedResults)
                complete(pets, nil)
            }
        }
    }
    
    private func parsePetResults(records: [CKRecord]) -> [Pet]{
        var pets = [Pet]()
        
        var index = 0
        records.forEach { (record) in
            
            let id = index
            let recordId = record.recordID.recordName
            let userId = record["userId"]
            let hungryLevel = record["hungryLevel"]
            let foodAmount = record["foodAmount"]
            let typePet = record["typePet"]

            let dateFormatter = ISO8601DateFormatter()
            
            pets.append(Pet(
                id: index,
                recordId: recordId,
                userId: userId as! String,
                hungryLevel: hungryLevel as! Float,
                foodAmount: foodAmount as! Int,
                typePet: (typePet as! String == "cat" ? Pet.TypePet.cat : Pet.TypePet.dog)
            ))
            
            index = index + 1
        }
        
        return pets
    }
    
    private func errorHandler(error: Error) {
        print("CloudKit Message :: ",error.localizedDescription)
    }
}
