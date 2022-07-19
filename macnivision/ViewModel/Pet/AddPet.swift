//
//  AddPet.swift
//  macnivision
//
//  Created by renaka agusta on 13/07/22.
//

import Foundation

class PetAddViewModel: ObservableObject {
    @Published var message: String?
    @Published var error: NSError?
    
    public func fetchPets(pet: Pet){
        PetService.shared.addPet(complete: {
            (message, error) in
            if let message = message {
                self.message = message
            } else {
                self.error = error
            }
        }, pet: pet)
    }
}
