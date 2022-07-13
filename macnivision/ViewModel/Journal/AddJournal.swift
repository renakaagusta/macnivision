//
//  AddJournal.swift
//  macnivision
//
//  Created by renaka agusta on 13/07/22.
//

import Foundation

class JournalAddViewModel: ObservableObject {
    @Published var message: String?
    @Published var error: NSError?
    
    public func fetchJournals(journal: Journal){
        JournalService.shared.addJournal(complete: {
            (message, error) in
            if let message = message {
                self.message = message
            } else {
                self.error = error
            }
        }, journal: journal)
    }
}
