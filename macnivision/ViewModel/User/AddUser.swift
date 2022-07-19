//
//  AddUser.swift
//  macnivision
//
//  Created by renaka agusta on 13/07/22.
//

import Foundation

class UserAddViewModel: ObservableObject {
    @Published var message: String?
    @Published var error: NSError?
    
    public func fetchUsers(user: User){
        UserService.shared.addUser(complete: {
            (message, error) in
            if let message = message {
                self.message = message
            } else {
                self.error = error
            }
        }, user: user)
    }
}
