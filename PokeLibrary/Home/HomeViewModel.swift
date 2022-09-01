//
//  HomeViewModel.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let apiPath: HomeAPIPaths
    
    init(apiPath: HomeAPIPaths) {
        self.apiPath = apiPath
    }
    
    func getPokemonList() {
        
    }
}

struct PokemonHomeData: Codable {
    var count: Int
    var nextURL: String
    var previousURL: String
    var pokemons: [Pokemon]
    
    private enum CodingKeys: String, CodingKey {
        case count, nextURL = "next", previousURL = "previous", pokemons = "results"
    }
}

struct Pokemon: Codable {
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
