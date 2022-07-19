//
//  Pet.swift
//  macnivision
//
//  Created by Theresia Saputri on 24/06/22.
//

import Foundation

struct Pet: Hashable, Codable, Identifiable{
    var id : Int
    var recordId : String
    var userId : String
    var hungryLevel : Int
    var foodAmount : Int
    var typePet: TypePet
    enum TypePet: String, CaseIterable, Codable{
        case cat = "cat"
        case dog = "dog"
    }
}
