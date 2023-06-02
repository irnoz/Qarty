//
//  UserManager.swift
//  Qarty
//
//  Created by Irakli Nozadze on 30.05.23.
//

import Foundation
import SwiftUI
import Combine

final class UserManager: ObservableObject {
    @Published
    var profile: Profile = Profile()
    
    @Published
    var settings: Settings = Settings()
    
    @Published
    var isRegistered: Bool
    
    init() {
        isRegistered = false
    }
    
    init(userName: String, password: String) {
        isRegistered = userName.isEmpty == false && password.isEmpty == false
        self.profile.userName = userName
        self.profile.password = password
    }
    
    func setRegistered() {
        isRegistered = profile.userName.isEmpty == false && profile.password.isEmpty == false
    }
    
    func persistProfile() {
        if settings.rememberUser {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(profile), forKey: "user-profile")
        }
    }
    
    func persistSettings() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(settings), forKey: "user-settings")
    }
    
    func load() {
        if let data = UserDefaults.standard.value(forKey: "user-profile") as? Data {
            if let profile = try? PropertyListDecoder().decode(Profile.self, from: data) {
                self.profile = profile
            }
        }
        setRegistered()
        
        if let data = UserDefaults.standard.value(forKey: "user-settings") as? Data {
            if let settings = try? PropertyListDecoder().decode(Settings.self, from: data) {
                self.settings = settings
            }
        }
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: "user-profile")
        isRegistered = false
        self.profile.userName = ""
        self.profile.password = ""
    }
    
    // MARK: validation not yet implemented
    func isUserNameValid() -> Bool {
        return profile.userName.count >= 3
    }
    
    func isPasswordValid() -> Bool {
        return profile.password.count >= 3
//        guard profile.password.count >= 3 else {
//            print("password size smaller than 3")
//            return false
//        }
//
//        return true
    }
}
