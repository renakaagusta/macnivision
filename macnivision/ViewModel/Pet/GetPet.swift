//
//  GetPet.swift
//  macnivision
//
//  Created by renaka agusta on 13/07/22.
//

import Foundation

class PetListViewModel: ObservableObject {
    @Published var pets: [Pet] = []
    
    init() {
        self.fetchPets()
    }
    
    public func fetchPets(){
        PetService.shared.fetchPets { (pets, error) in
            if let pets = pets {
                self.pets = pets
            }
        }
    }
}
