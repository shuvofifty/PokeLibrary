//
//  PokeFont.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/26/22.
//

import Foundation
import SwiftUI

extension Font {
    static func foundation(style: FontStyle) -> Font {
        Font.custom(FontType.Roboto.getFontName(), size: style.getSize())
    }
}

extension UIFont {
    static func foundation(style: FontStyle, weight: UIFont.Weight) -> UIFont {
        guard let font = UIFont(name: FontType.Roboto.getFontName(with: weight), size: style.getSize()) else {
            fatalError("Font not found")
        }
        
        return font
    }
}

enum FontStyle {
    case body, body1, title, title1, navigationTitle
    
    func getSize() -> CGFloat {
        switch self {
        case .title: return 35
        case .title1: return 30
        case .body: return 18
        case .body1: return 16
        case .navigationTitle: return 20
        }
    }
}

enum FontType {
    case Roboto
    
    func getFontName() -> String {
        switch self {
        case .Roboto:
            return "Roboto Condensed"
        }
    }
    
    func getFontName(with weight: UIFont.Weight) -> String {
        switch weight {
        case .bold, .black, .heavy, .medium, .semibold:
            return "RobotoCondensed-Bold"
        case .light, .ultraLight, .thin:
            return "RobotoCondensed-Light"
        default:
            return "RobotoCondensed-Regular"
        }
    }
}
