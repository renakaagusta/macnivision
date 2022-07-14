//
//  Journal.swift
//  macnivision
//
//  Created by Theresia Saputri on 24/06/22.
//
import Foundation
import SwiftUI
import CoreLocation

struct JournalDummy : Hashable, Codable, Identifiable {
    var id : Int
    var recordId : String
    var userId : String
    var journalDate: String
    var entryDate: Date {
        translateDate(inputDate: journalDate)
    }
    var diary : String
    var note : String
    var emotion : [String]
    
}

func translateDate(inputDate: String) -> Date{
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "HH:mm, d MMM y"
    
    return dateFormater.date(from: inputDate) ?? Date()
}
