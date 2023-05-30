//
//  LogoPlaceholderImage.swift
//  Qarty
//
//  Created by Irakli Nozadze on 30.05.23.
//

import SwiftUI

struct LogoPlaceholderImage: View {
  var body: some View {
    Image(systemName: "cross.fill")
      .resizable()
      .frame(width: 30, height: 30)
      .overlay(Circle().stroke(Color.gray, lineWidth: 1))
      .background(Color(white: 0.95))
      .clipShape(Circle())
      .foregroundColor(.red)
  }
}

struct LogoPlaceholderImage_Previews: PreviewProvider {
    static var previews: some View {
        LogoPlaceholderImage()
    }
}
