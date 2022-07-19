//
//  JournalList.swift
//  macnivision
//
//  Created by renaka agusta on 13/07/22.
//

import Foundation

class JournalListViewModel: ObservableObject {
    @Published var medicals: [Journal] = []
    
    init() {
        self.fetchJournals()
    }
    
    public func fetchJournals(){
        JournalService.shared.fetchJournals { (medicals, error) in
            if let medicals = medicals {
                self.medicals = medicals
            }
        }
    }
}
