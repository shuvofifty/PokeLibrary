//
//  PokemonTypeDetailResponse.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/12/22.
//

import Foundation

struct PokemonTypeDetailResponse {
    var name: String
    var pokemons: [Pokemon]
    
    init(rawJson: [String: Any]) {
        name = rawJson["name"] as? String ?? ""
        
        let rawPokemons = rawJson["pokemon"] as? [[String: Any]] ?? []
        pokemons = []
        for rawPokemon in rawPokemons {
            let pokeObject = rawPokemon["pokemon"] as? [String: Any]
            let pokemon = Pokemon(
                name: (pokeObject?["name"] as? String) ?? "",
                pokemonID: Pokemon.extractId(url: (pokeObject?["url"] as? String) ?? "") ?? 0
            )
            pokemons.append(pokemon)
        }
    }
}
