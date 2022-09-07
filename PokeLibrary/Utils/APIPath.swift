//
//  APIPath.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import Foundation

class APIProdPathImp: HomeAPIPaths {
    var baseURL: String = "https://pokeapi.co/api"
    
    var version: String = "/v2"
    
    var pokemonList: String = "/pokemon"
    var pokemonImage: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    
    func getURL(for url: String) -> String {
        "\(baseURL)\(version)\(url)"
    }
}

protocol APIPath {
    var baseURL: String { get }
    var version: String { get }
    
    func getURL(for url: String) -> String
}

protocol HomeAPIPaths: APIPath {
    var pokemonList: String { get }
    var pokemonImage: String { get }
}
