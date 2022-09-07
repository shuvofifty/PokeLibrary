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
}

public class PokemonDataControllerImp: PokemonDataController {
    private let apiPath: HomeAPIPaths
    private let networking: Networking
    
    init(apiPath: HomeAPIPaths, networking: Networking) {
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
}
