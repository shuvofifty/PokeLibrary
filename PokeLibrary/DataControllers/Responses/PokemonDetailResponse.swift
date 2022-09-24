//
//  PokemonDetailResponse.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/14/22.
//

import Foundation

public struct PokemonDetailResponse: Codable {
    var height: Double?
    var moves: [Move]?
    var pokemonId: Int?
    var name: String?
    var weight: Double?
    var types: [PokemonTypeBranchStruct]
    
    enum CodingKeys: String, CodingKey {
        case height, moves, pokemonId = "id", name, weight, types
    }
    
    struct Move: Codable {
        var name: String
        var url: String
        
        enum L1Key: String, CodingKey {
            case move
        }
        enum L2Key: String, CodingKey {
            case name, url
        }
        
        init(from decoder: Decoder) throws {
            let moveContainer = try decoder.container(keyedBy: L1Key.self)
            let moveDetailContainer = try moveContainer.nestedContainer(keyedBy: L2Key.self, forKey: .move)
            
            name = try moveDetailContainer.decodeIfPresent(String.self, forKey: .name) ?? ""
            url = try moveDetailContainer.decodeIfPresent(String.self, forKey: .url) ?? ""
        }
    }
    
    struct PokemonTypeBranchStruct: Codable {
        var pokemonType: PokemonType
        var typeId: Int
        
        enum L1Key: String, CodingKey {
            case type
        }
        
        enum L2Key: String, CodingKey {
            case name, url
        }
        
        init(from decoder: Decoder) throws {
            let typeContainer = try decoder.container(keyedBy: L1Key.self)
            let typeBranchContainer = try typeContainer.nestedContainer(keyedBy: L2Key.self, forKey: .type)
            
            pokemonType = PokemonType(rawValue: try typeBranchContainer.decodeIfPresent(String.self, forKey: .name) ?? "") ?? .unknown
            let url = try typeBranchContainer.decodeIfPresent(String.self, forKey: .url) ?? ""
            if let id = Int(url.replacingOccurrences(of: "https://pokeapi.co/api/v2/type/", with: "").replacingOccurrences(of: "/", with: "")) {
                typeId = id
            } else {
                typeId = -1
            }
        }
    }
}
