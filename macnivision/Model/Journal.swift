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
    var userId : Int
    var entryDate : Date
    var diary : String
    var note : String
    var emotion : Emotion
    enum Emotion: String, CaseIterable, Codable{
        case angry = "angry"
        case sad = "sad"
        case worry = "worry"
        case surprise = "surprise"
        case happy = "happy"
    }
}

