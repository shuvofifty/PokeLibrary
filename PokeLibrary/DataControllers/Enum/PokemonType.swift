//
//  PokemonType.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/23/22.
//

import Foundation
import SwiftUI

enum PokemonType: String {
    typealias TypeColorCombo = (primary: Color, secondary: Color)
    
    case normal, fighting, flying, poison, ground, rock, bug, ghost, steel, fire, water, grass, electric, psychic, ice, dragon, dark, fairy, unknown, shadow
    
    func getColorCombo() -> TypeColorCombo {
        switch self {
        case .normal:
            return (Color(.sRGB, red: 208/255, green: 208/255, blue: 208/255, opacity: 1), .white)
        case .fighting:
            return (Color(.sRGB, red: 244/255, green: 34/255, blue: 114/255, opacity: 1), .white)
        case .flying:
            return (Color(.sRGB, red: 14/255, green: 140/255, blue: 177/255, opacity: 1), .white)
        case .poison:
            return (Color(.sRGB, red: 161/255, green: 77/255, blue: 160/255, opacity: 1), .white)
        case .ground:
            return (Color(.sRGB, red: 239/255, green: 99/255, blue: 81/255, opacity: 1), .white)
        case .rock:
            return (Color(.sRGB, red: 216/255, green: 157/255, blue: 106/255, opacity: 1), .black)
        case .bug:
            return (Color(.sRGB, red: 155/255, green: 229/255, blue: 100/255, opacity: 1), .black)
        case .ghost:
            return (Color(.sRGB, red: 118/255, green: 101/255, blue: 147/255, opacity: 1), .white)
        case .steel:
            return (Color(.sRGB, red: 22/255, green: 105/255, blue: 122/255, opacity: 1), .white)
        case .fire:
            return (Color(.sRGB, red: 255/255, green: 166/255, blue: 43/255, opacity: 1), .black)
        case .water:
            return (Color(.sRGB, red: 72/255, green: 159/255, blue: 181/255, opacity: 1), .white)
        case .grass:
            return (Color(.sRGB, red: 56/255, green: 134/255, blue: 89/255, opacity: 1), .white)
        case .electric:
            return (Color(.sRGB, red: 239/255, green: 160/255, blue: 11/255, opacity: 1), .black)
        case .psychic:
            return (Color(.sRGB, red: 229/255, green: 89/255, blue: 52/255, opacity: 1), .white)
        case .ice:
            return (Color(.sRGB, red: 0/255, green: 204/255, blue: 181/255, opacity: 1), .white)
        case .dragon:
            return (Color(.sRGB, red: 34/255, green: 116/255, blue: 165/255, opacity: 1), .white)
        case .dark:
            return (Color(.sRGB, red: 55/255, green: 57/255, blue: 46/255, opacity: 1), .white)
        case .fairy:
            return (Color(.sRGB, red: 168/255, green: 96/255, blue: 168/255, opacity: 1), .white)
        case .unknown:
            return (Color(.sRGB, red: 55/255, green: 57/255, blue: 46/255, opacity: 1), .white)
        case .shadow:
            return (Color(.sRGB, red: 55/255, green: 57/255, blue: 46/255, opacity: 1), .white)
        }
    }
}
