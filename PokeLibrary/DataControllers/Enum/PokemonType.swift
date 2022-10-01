//
//  PokemonType.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/23/22.
//

import Foundation
import SwiftUI

enum PokemonType: String, Codable {
    typealias TypeColorCombo = (primary: Color, secondary: Color)
    
    case normal, fighting, flying, poison, ground, rock, bug, ghost, steel, fire, water, grass, electric, psychic, ice, dragon, dark, fairy, unknown, shadow
    
    func getColorCombo() -> TypeColorCombo {
        switch self {
        case .normal:
            return (Color(.sRGB, red: 168/255, green: 167/255, blue: 122/255, opacity: 1), .white)
        case .fighting:
            return (Color(.sRGB, red: 194/255, green: 46/255, blue: 40/255, opacity: 1), .white)
        case .flying:
            return (Color(.sRGB, red: 169/255, green: 143/255, blue: 243/255, opacity: 1), .white)
        case .poison:
            return (Color(.sRGB, red: 163/255, green: 62/255, blue: 161/255, opacity: 1), .white)
        case .ground:
            return (Color(.sRGB, red: 226/255, green: 191/255, blue: 101/255, opacity: 1), .white)
        case .rock:
            return (Color(.sRGB, red: 182/255, green: 161/255, blue: 54/255, opacity: 1), .black)
        case .bug:
            return (Color(.sRGB, red: 166/255, green: 185/255, blue: 26/255, opacity: 1), .black)
        case .ghost:
            return (Color(.sRGB, red: 115/255, green: 87/255, blue: 151/255, opacity: 1), .white)
        case .steel:
            return (Color(.sRGB, red: 183/255, green: 183/255, blue: 206/255, opacity: 1), .white)
        case .fire:
            return (Color(.sRGB, red: 238/255, green: 129/255, blue: 48/255, opacity: 1), .white)
        case .water:
            return (Color(.sRGB, red: 99/255, green: 144/255, blue: 240/255, opacity: 1), .white)
        case .grass:
            return (Color(.sRGB, red: 122/255, green: 199/255, blue: 76/255, opacity: 1), .white)
        case .electric:
            return (Color(.sRGB, red: 247/255, green: 208/255, blue: 44/255, opacity: 1), .black)
        case .psychic:
            return (Color(.sRGB, red: 249/255, green: 85/255, blue: 135/255, opacity: 1), .white)
        case .ice:
            return (Color(.sRGB, red: 150/255, green: 217/255, blue: 214/255, opacity: 1), .white)
        case .dragon:
            return (Color(.sRGB, red: 111/255, green: 53/255, blue: 252/255, opacity: 1), .white)
        case .dark:
            return (Color(.sRGB, red: 112/255, green: 87/255, blue: 70/255, opacity: 1), .white)
        case .fairy:
            return (Color(.sRGB, red: 214/255, green: 133/255, blue: 173/255, opacity: 1), .white)
        case .unknown:
            return (Color(.sRGB, red: 55/255, green: 57/255, blue: 46/255, opacity: 1), .white)
        case .shadow:
            return (Color(.sRGB, red: 55/255, green: 57/255, blue: 46/255, opacity: 1), .white)
        }
    }
    
    func getIconString() -> String {
        switch self {
        case .normal:
            return "normal"
        case .fighting:
            return "fighting"
        case .flying:
            return "flying"
        case .poison:
            return "poison"
        case .ground:
            return "ground"
        case .rock:
            return "rock"
        case .bug:
            return "bug"
        case .ghost:
            return "ghost"
        case .steel:
            return "steel"
        case .fire:
            return "fire"
        case .water:
            return "water"
        case .grass:
            return "grass"
        case .electric:
            return "electric"
        case .psychic:
            return "psyic"
        case .ice:
            return "ice"
        case .dragon:
            return "dragon"
        case .dark:
            return "dark"
        case .fairy:
            return "fairy"
        case .unknown:
            return "NoImage"
        case .shadow:
            return "NoImage"
        }
    }
    
    func getName() -> String {
        self.rawValue.capitalized
    }
}

struct PokemonTypeStruct: Identifiable, Hashable {
    var id = UUID()
    var type: PokemonType
}
