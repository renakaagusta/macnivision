//
//  Journal.swift
//  macnivision
//
//  Created by Theresia Saputri on 24/06/22.
//

import Foundation

struct Journal : Hashable, Codable, Identifiable {
    var id : Int
    var recordId : String
    var userId : String
    var entryDate : Date
    var diary : String
    var note : String
    var emotion : [String]
}

