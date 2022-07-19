//
//  GetUser.swift
//  macnivision
//
//  Created by renaka agusta on 13/07/22.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        self.fetchUsers()
    }
    
    public func fetchUsers(){
        UserService.shared.fetchUsers { (users, error) in
            if let users = users {
                self.users = users
            }
        }
    }
}
