//
//  PokemonDataController.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/6/22.
//

import Foundation
import Combine
import UIKit

public protocol PokemonDataController {
    func getPokemonList() -> AnyPublisher<PokemonHomeData, APIError>
    func getPokemonSpriteURL(for id: Int) -> String
    func getPokemonTypes() -> AnyPublisher<PokemonTypeResponseData, APIError>
}

public class PokemonDataControllerImp: PokemonDataController {
    private let apiPath: HomeAPIPaths & CategoryAPIPath
    private let networking: Networking
    
    init(apiPath: HomeAPIPaths & CategoryAPIPath, networking: Networking) {
        self.apiPath = apiPath
        self.networking = networking
    }
    
    public func getPokemonList() -> AnyPublisher<PokemonHomeData, APIError> {
        networking.send(request: Request(type: .GET, url: apiPath.getURL(for: apiPath.pokemonList), header: [:], body: [:]))
            .receive(on: DispatchQueue.main)
            .decode(type: PokemonHomeData.self, decoder: JSONDecoder())
            .mapError{ $0 as! APIError }
            .eraseToAnyPublisher()
    }
    
    public func getPokemonSpriteURL(for id: Int) -> String {
        "\(apiPath.pokemonImage)\(id).png"
    }
    
    public func getPokemonTypes() -> AnyPublisher<PokemonTypeResponseData, APIError> {
        networking.send(request: Request(type: .GET, url: apiPath.getURL(for: apiPath.pokemonType), header: [:], body: [:]))
            .receive(on: DispatchQueue.main)
            .decode(type: PokemonTypeResponseData.self, decoder: JSONDecoder())
            .mapError{ $0 as! APIError }
            .eraseToAnyPublisher()
    }
    
    public func getPokemonDetail(for id: Int) {
        
    }
}
