//
//  HomeViewModel.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private let pokemonDataController: PokemonDataController
    var subscriptions = Set<AnyCancellable>()
    
    init(pokemonDataController: PokemonDataController) {
        self.pokemonDataController = pokemonDataController
    }
    
    func getPokemonList() {
        pokemonDataController.getPokemonList()
            .sink(receiveCompletion: { print("hAHAHA ERROR:  \($0)") }, receiveValue: { print("WOOOOOOW SUCCESSSSS:  \($0)") })
            .store(in: &subscriptions)
    }
}

public struct PokemonHomeData: Codable {
    var count: Int?
    var nextURL: String?
    var previousURL: String?
    var pokemons: [Pokemon]?
    
    private enum CodingKeys: String, CodingKey {
        case count, nextURL = "next", previousURL = "previous", pokemons = "results"
    }
}

struct Pokemon: Codable {
    var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

public protocol PokemonDataController {
    func getPokemonList() -> AnyPublisher<PokemonHomeData, APIError>
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
}
