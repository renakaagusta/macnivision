//
//  AddJournal.swift
//  MC1-Deppy
//
//  Created by Theresia Saputri on 13/07/22.
//

import Foundation
import SwiftUI

class JournalAddViewModel: ObservableObject{
    @Published var id : Int = 0
    @Published var recordId : String = ""
    @Published var userId : String = ""
    @Published var entryDate : Date = Date()
    @Published var diary : String = ""
    @Published var note : String = ""
    @Published var emotion : [String] = []
}
