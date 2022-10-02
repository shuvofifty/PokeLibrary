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
    var doubleDamageFrom: [PokemonType] = []
    var strongAgainst: [PokemonType] = []
    
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
        
        let rawDoubleDamageArr = (rawJson["damage_relations"] as? [String:Any])?["double_damage_from"] as? [[String:Any]]
        
        for rawType in rawDoubleDamageArr ?? [] {
            if let type = PokemonType(rawValue: rawType["name"] as? String ?? "") {
                doubleDamageFrom.append(type)
            }
        }
        
        let rawStrongAgainstArr = (rawJson["damage_relations"] as? [String:Any])?["double_damage_to"] as? [[String:Any]]
        
        for rawType in rawStrongAgainstArr ?? [] {
            if let type = PokemonType(rawValue: rawType["name"] as? String ?? "") {
                strongAgainst.append(type)
            }
        }
    }
}
