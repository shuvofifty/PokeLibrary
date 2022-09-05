//
//  HomeViewModel.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private let apiPath: HomeAPIPaths
    private let networking: Networking
    var subscriptions = Set<AnyCancellable>()
    
    init(apiPath: HomeAPIPaths, networking: Networking) {
        self.apiPath = apiPath
        self.networking = networking
    }
    
    func getPokemonList() {
        networking.send(request: Request(type: .GET, url: apiPath.getURL(for: apiPath.pokemonList), header: [:], body: [:]))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })
            .store(in: &subscriptions)
        
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
