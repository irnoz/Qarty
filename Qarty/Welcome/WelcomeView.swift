//
//  WelcomeView.swift
//  Qarty
//
//  Created by Irakli Nozadze on 30.05.23.
//

import SwiftUI

struct WelcomeView: View {
    @State var startPractice = false
    @EnvironmentObject var userManager: UserManager

    @ViewBuilder
    var body: some View {
        if startPractice {
            HomeView()
        } else {
            ZStack {
                WelcomeBackgroundImage()
                VStack(alignment: .center) {
                    Spacer()

                    Text(verbatim: "Hello, \(userManager.profile.userName)!")

                    WelcomeMessageView()

                    Button {
                        startPractice.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "play")
                            Text("Start Practice")
                        }
                    }

                    Spacer()

                }
                .bold()
                .foregroundColor(.red)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(UserManager())
    }
}
