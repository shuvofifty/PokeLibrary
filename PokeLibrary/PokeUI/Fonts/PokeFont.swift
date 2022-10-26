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

enum FontStyle {
    case body, body1, title, title1
    
    func getSize() -> CGFloat {
        switch self {
        case .title: return 35
        case .title1: return 30
        case .body: return 18
        case .body1: return 16
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
}
