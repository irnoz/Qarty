//
//  HomeView.swift
//  Qarty
//
//  Created by Irakli Nozadze on 31.05.23.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab = 0
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            LearnView()
                .tabItem({
                    VStack {
                        Image(systemName: "bookmark")
                        Text("Learn")
                    }
                })
                .tag(1)
            
            SettingsView()
                .tabItem({
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                })
                .tag(2)
        }
        .accentColor(.red)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserManager())
    }
}
