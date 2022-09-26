//
//  PokemonTypeResponseData.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation

public struct PokemonTypeResponseData: Codable {
    var count: Int
    var types: [PokemonTypeData]
    
    private enum CodingKeys: String, CodingKey {
        case count, types = "results"
    }
}

public struct PokemonTypeData: Codable, Identifiable {
    var type: PokemonType
    var typeId: Int
    public var id = UUID()
    
    private enum RootKeys: String, CodingKey {
        case name, url
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        type =  PokemonType(rawValue: try container.decodeIfPresent(String.self, forKey: .name) ?? "") ?? .unknown
        let url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        if let id = Int(url.replacingOccurrences(of: "https://pokeapi.co/api/v2/type/", with: "").replacingOccurrences(of: "/", with: "")) {
            typeId = id
        } else {
            typeId = -1
        }
    }
}
