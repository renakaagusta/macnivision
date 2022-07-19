//
//  HealthCardService.swift
//  macnivision
//
//  Created by renaka agusta on 10/07/22.
//

import Foundation
import CloudKit

class MedicalService {
    static let shared: MedicalService = {
        return MedicalService()
    }()
    
    var recordID:CKRecord.ID?
    private var defaultContainer = CKContainer(identifier: "iCloud.macnivision")
    
    func fetchMedicals(complete: @escaping (_ instance: [Medical]?, _ error: NSError?) -> ()){
        let pred = NSPredicate(value: true)
        let query = CKQuery(recordType: "Medical", predicate: pred)
        defaultContainer.publicCloudDatabase.perform(query, inZoneWith: nil) {[self] results, error in
            if let error = error {
                self.errorHandler(error: error)
                complete(nil,error as NSError)
            } else if let checkedResults = results {
                let Medicals = self.parseMedicalResults(records: checkedResults)
                complete(Medicals,nil)
            }
        }
    }
    
    private func parseMedicalResults(records: [CKRecord]) -> [Medical]{
        var medicals = [Medical]()
        
        var index = 0
        records.forEach { (record) in
            
            let id = index
            let recordId = record.recordID.recordName
            let name = record["name"] ?? ""
            let image = record["image"] as! CKAsset
            let contactNumber = record["contactNumber"] ?? ""
            let address = record["address"] ?? ""
            let city = record["city"] ?? "" 
            let description = record["description"] ?? ""
            let medicalType = record["medicalType"] == "hospital" ? Medical.MedicalType.hospital : Medical.MedicalType.psychiatrist
            
            medicals.append(Medical(
                id: id,
                recordId: recordId,
                name: name as! String,
                contactNumber: contactNumber as! String,
                address: address as! String,
                city: city as! String,
                description: description as! String,
                image: image.fileURL!.absoluteString,
                medicalType: medicalType
            ))
            
            index = index + 1
        }
        
        return medicals
    }
    
    private func errorHandler(error: Error) {
        print("CloudKit Message :: ",error.localizedDescription)
    }
}
