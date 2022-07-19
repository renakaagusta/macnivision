//
//  ScheduleScheduleService.swift
//  macnivision
//
//  Created by renaka agusta on 13/07/22.
//


import Foundation
import CloudKit

class ScheduleService {
    static let shared: ScheduleService = {
        return ScheduleService()
    }()
    
    var recordID:CKRecord.ID?
    private var defaultContainer = CKContainer(identifier: "iCloud.macnivision")
    
    func fetchSchedules(complete: @escaping (_ instance: [Schedule]?, _ error: NSError?) -> ()){
        let pred = NSPredicate(value: true)
        let query = CKQuery(recordType: "MedicalSchedule", predicate: pred)
        defaultContainer.publicCloudDatabase.perform(query, inZoneWith: nil) {[self] results, error in
            if let error = error {
                self.errorHandler(error: error)
                complete(nil,error as NSError)
            } else if let checkedResults = results {
                let Schedules = self.parseScheduleResults(records: checkedResults)
                complete(Schedules,nil)
            }
        }
    }
    
    private func parseScheduleResults(records: [CKRecord]) -> [Schedule]{
        var schedules = [Schedule]()
        
        var index = 0
        records.forEach { (record) in
            
            let id = index
            let recordId = record.recordID.recordName
            let day = record["day"]
            let openedAt = record["openedAt"]
            let closedAt = record["closedAt"]
            let medicalId = record["medicalId"]
            
            schedules.append(Schedule(
                id: index,
                recordId: recordId,
                day: day as! String,
                openedAt: openedAt as! String,
                closedAt: closedAt as! String,
                medicalId: medicalId as! String
            ))
            
            index = index + 1
        }
        
        return schedules
    }
    
    private func errorHandler(error: Error) {
        print("CloudKit Message :: ",error.localizedDescription)
    }
}
