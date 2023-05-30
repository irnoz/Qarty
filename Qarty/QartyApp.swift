//
//  QartyApp.swift
//  Qarty
//
//  Created by Irakli Nozadze on 30.05.23.
//

import SwiftUI

@main
struct QartyApp: App {
    let userManager = UserManager()
    
    init() {
        userManager.load()
    }
    var body: some Scene {
        WindowGroup {
            RegisterView()
                .environmentObject(userManager)
        }
    }
}

struct KuchiApp_Previews: PreviewProvider {
    static let userManager = UserManager(userName: "Irakli", password: "Password")
    
    static var previews: some View {
        RegisterView()
            .environmentObject(userManager)
    }
}
