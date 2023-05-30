//
//  Profile.swift
//  Qarty
//
//  Created by Irakli Nozadze on 30.05.23.
//

import Foundation

struct Profile: Codable {
    var userName: String
    var password: String
    
    init() {
        userName = ""
        password = ""
    }
    
    init(named userName: String, and password: String) {
        self.userName = userName
        self.password = password
    }
}
