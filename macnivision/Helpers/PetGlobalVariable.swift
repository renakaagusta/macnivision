//
//  PetGlobalVariable.swift
//  macnivision
//
//  Created by Jevier Izza Maulana on 12/07/22.
//

import Foundation


final class PetGlobalVariable: ObservableObject {
    
    static let petGlobal = PetGlobalVariable()
    
    @Published var hungryLevel: Float = 0.0
    @Published var petFoodAmount: Int = 0
    
}
