//
//  PokemonHomeData.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/6/22.
//

import Foundation

public struct PokemonHomeData: Codable {
    var count: Int?
    var nextURL: String?
    var previousURL: String?
    var pokemons: [Pokemon]?
    
    private enum CodingKeys: String, CodingKey {
        case count, nextURL = "next", previousURL = "previous", pokemons = "results"
    }
}

struct Pokemon: Codable, Identifiable {
    var name: String?
    var id = UUID()
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
