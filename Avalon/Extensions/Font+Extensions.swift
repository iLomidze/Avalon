//
//  Font+Extensions.swift
//  Avalon
//
//  Created by Irakli Lomidze on 07.12.22.
//

import SwiftUI

extension Font {
    enum RobotoFontType: String {
        case medium = "Medium"
        case light = "Light"
        case regular = "Regular"
        case mediumItalic = "MediumItalic"
        case thinItalic = "ThinItalic"
        case boldItalic = "BoldItalic"
        case lightItalic = "LightItalic"
        case italic = "Italic"
        case blackItalic = "BlackItalic"
        case bold = "Bold"
        case thin = "Thin"
        case black = "Black"
    }
    
    enum NunitoFontType: String {
        case medium = "Medium"
        case extraBoldItalic = "ExtraBoldItalic"
        case extraBold = "ExtraBold"
        case extraLightItalic = "ExtraLightItalic"
        case light = "Light"
        case regular = "Regular"
        case semiBold = "SemiBold"
        case bold = "Bold"
        case boldItalic = "BoldItalic"
        case black = "Black"
        case extraLight = "ExtraLight"
        case semiBoldItalic = "SemiBoldItalic"
        case blackItalic = "BlackItalic"
        case italic = "Italic"
        case lightItalic = "LightItalic"
        case mediumItalic = "MediumItalic"
    }
    
    static func roboto(type: RobotoFontType = .medium, size: CGFloat = 16) -> Font {
        return Font.custom("Roboto-" + type.rawValue, size: size)
    }
    
    static func nunito(type: NunitoFontType = .medium, size: CGFloat = 16) -> Font {
        return Font.custom("Nunito-" + type.rawValue, size: size)
    }
}
