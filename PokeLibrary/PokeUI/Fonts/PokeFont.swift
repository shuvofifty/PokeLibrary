//
//  PokeFont.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/26/22.
//

import Foundation
import SwiftUI

class PokeFont {
    enum FontType {
        case Roboto
        
        func getFontName() -> String {
            switch self {
            case .Roboto:
                return "Roboto Condensed"
            }
        }
    }
    
    static let shared = PokeFont()
    
    func get(_ font: FontType, size: CGFloat) -> Font {
        Font.custom(font.getFontName(), size: size)
    }
    
    func globalFont(_ size: CGFloat) -> Font {
        get(.Roboto, size: size)
    }
}
