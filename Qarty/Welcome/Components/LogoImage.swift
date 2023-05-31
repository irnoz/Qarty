//
//  LogoImage.swift
//  Qarty
//
//  Created by Irakli Nozadze on 30.05.23.
//

import SwiftUI

struct LogoImage: View {
    var body: some View {
        Image("qarty-background")
            .resizable()
            .frame(width: 40, height: 55)
//            .overlay(Ellipse().stroke(Color.gray, lineWidth: 1))
//            .background(Color(white: 0.95))
//            .clipShape(Ellipse())
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.gray, lineWidth: 1))
            .background(Color(white: 0.95))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct LogoImage_Previews: PreviewProvider {
    static var previews: some View {
        LogoImage()
    }
}
