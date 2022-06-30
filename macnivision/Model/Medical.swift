//
//  Medical.swift
//  macnivision
//
//  Created by Theresia Saputri on 24/06/22.
//

import Foundation
import SwiftUI

struct Medical : Hashable, Codable, Identifiable {
    var id : Int
    var name : String
    var email : String = ""
    var contactNumber : String
    var telephoneNumber : String = ""
    var openedAt : String = "00:00"
    var closedAt : String = "00:00"
    var schedule : [Schedule] = []
    var address : String
    var city : String
    var description: String
    
    var medicalPicture: String
    var image: Image{
        Image(medicalPicture)
    }
    
    var medicalType: MedicalType
    enum MedicalType: String, CaseIterable, Codable{
        case hospital = "hospital"
        case psychiatrist = "psychiatrist"
    }
}

struct Schedule : Hashable, Codable, Identifiable {
    var id : Int
    var day : String
    var openedAt : String
    var closedAt : String
}
