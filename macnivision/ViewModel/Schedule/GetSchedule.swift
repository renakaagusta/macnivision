//
//  ScheduleList.swift
//  macnivision
//
//  Created by renaka agusta on 13/07/22.
//

import Foundation

class ScheduleListViewModel: ObservableObject {
    @Published var schedules: [Schedule] = []
    
    init() {
        self.fetchSchedules()
    }
    
    public func fetchSchedules(){
        ScheduleService.shared.fetchSchedules { (schedules, error) in
            if let schedules = schedules {
                self.schedules = schedules
            }
        }
    }
}
