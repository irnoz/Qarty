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
    @AppStorage("appearance") var appearance: Appearance = .automatic
    
    init() {
        userManager.load()
    }
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
                .environmentObject(ChallengesViewModel())
                .preferredColorScheme(appearance.getColorScheme())
        }
    }
}

struct QartyApp_Previews: PreviewProvider {
    static let userManager = UserManager(userName: "Irakli", password: "Password")
    
    static var previews: some View {
        StarterView()
            .environmentObject(userManager)
    }
}
