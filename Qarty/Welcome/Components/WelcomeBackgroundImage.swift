//
//  WelcomeBackgroundImage.swift
//  Qarty
//
//  Created by Irakli Nozadze on 30.05.23.
//

import SwiftUI

struct WelcomeBackgroundImage: View {
    var body: some View {
      Image("qarty-background")
        .resizable()
        .opacity(0.2)
        .ignoresSafeArea(.all)
        .blur(radius: 5)
//        .aspectRatio(1 / 1, contentMode: .fill)
        .rotationEffect(.degrees(8))
        
    }
}

struct WelcomeBackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackgroundImage()
    }
}
