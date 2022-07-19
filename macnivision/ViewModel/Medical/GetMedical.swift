//
//  MedicalList.swift
//  macnivision
//
//  Created by renaka agusta on 10/07/22.
//

import Foundation

class MedicalListViewModel: ObservableObject {
    @Published var medicals: [Medical] = []
    
    init() {
        self.fetchMedicals()
    }
    
    public func fetchMedicals(){
        MedicalService.shared.fetchMedicals { (medicals, error) in
            if let medicals = medicals {
                self.medicals = medicals
            }
        }
    }
}
