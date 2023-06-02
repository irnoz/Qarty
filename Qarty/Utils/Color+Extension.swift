//
//  Color+Extension.swift
//  Qarty
//
//  Created by Irakli Nozadze on 31.05.23.
//

import struct SwiftUI.Color

// swiftlint:disable all

extension Color {
    init(rgba: Int) {
        self.init(
            .sRGB,
            red: Double((rgba & 0xFF000000) >> 24) / 255,
            green: Double((rgba & 0x00FF0000) >> 16) / 255,
            blue: Double((rgba & 0x0000FF00) >> 8) / 255,
            opacity: Double((rgba & 0x000000FF)) / 255
        )
    }

    var asRgba: Int {
        let components = cgColor!.components!
        let (r, g, b, a) = (components[0], components[1], components[2], components[3])
        return (Int(a * 255) << 0) +
               (Int(b * 255) << 8) +
               (Int(g * 255) << 16) +
               (Int(r * 255) << 24)
    }
}
