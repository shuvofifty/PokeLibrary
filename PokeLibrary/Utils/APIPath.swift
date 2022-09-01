//
//  APIPath.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import Foundation

class APIProdPathImp: APIPath, HomeAPIPaths {
    var baseURL: String = "https://pokeapi.co/api"
    
    var version: String = "/v2"
    
    var pokemonList: String = "/pokemon"
    
    
}

protocol APIPath {
    var baseURL: String { get }
    var version: String { get }
}

protocol HomeAPIPaths {
    var pokemonList: String { get }
}
