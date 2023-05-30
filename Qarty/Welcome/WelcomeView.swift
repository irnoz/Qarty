//
//  WelcomeView.swift
//  Qarty
//
//  Created by Irakli Nozadze on 30.05.23.
//

import SwiftUI

struct WelcomeView: View {
    @State var startPractice = false
    
    var body: some View {
        ZStack {
            WelcomeBackgroundImage()
            VStack(alignment: .center) {
                Text(verbatim: "Hello, New User!")
                    
                WelcomeMessageView()
                
                Button {
                    startPractice.toggle()
                } label: {
                    HStack {
                        Image(systemName: "play")
                        Text("Start Practice")
                    }
                }
            }
            .bold()
            .foregroundColor(.red)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
