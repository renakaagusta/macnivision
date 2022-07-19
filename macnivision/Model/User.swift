//
//  User.swift
//  macnivision
//
//  Created by Theresia Saputri on 24/06/22.
//

import Foundation

struct User: Hashable, Codable, Identifiable{
    var id: Int
    var recordId : String
    var nickname: String
}
