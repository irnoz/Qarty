//
//  StarterView.swift
//  Qarty
//
//  Created by Irakli Nozadze on 30.05.23.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var userManager: UserManager

    @ViewBuilder
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    userManager.clear()
                } label: {
                    HStack {
                        Text("Log Out")
                    }
                }
//                .bordered()
                .foregroundColor(.red)
                .padding(.trailing)
            }

            if userManager.isRegistered {
                WelcomeView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
