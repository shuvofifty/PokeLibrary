//
//  PokemonDetailResponse.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/14/22.
//

import Foundation

public struct PokemonDetailResponse: Codable {
    var height: Int
    var moves: [Move]
    
    
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
}
