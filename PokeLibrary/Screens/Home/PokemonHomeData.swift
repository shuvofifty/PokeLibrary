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
    var name: String
    var pokemonID: Int
    var id = UUID()
    
    private enum RootKeys: String, CodingKey {
        case name = "name"
        case url
    }
    
    init(name: String, pokemonID: Int) {
        self.name = name
        self.pokemonID = pokemonID
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? "No Name"
        let url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        if let id = Pokemon.extractId(url: url) {
            pokemonID = id
        } else {
            pokemonID = -1
        }
    }
    
    static func extractId(url: String) -> Int? {
        Int(url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "").replacingOccurrences(of: "/", with: ""))
    }
}
