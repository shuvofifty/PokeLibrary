//
//  HomeViewModel.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import Foundation
import Combine
import UIKit

extension HomeView {
    class ViewModel: ObservableObject {
        private let pokemonDataController: PokemonDataController
        public private(set) var cordinator: HomeCordinator
        var subscriptions = Set<AnyCancellable>()
        
        @Published var pokemons: [PokemonHomeViewData]
        
        init(pokemonDataController: PokemonDataController, cordinator: HomeCordinator) {
            self.pokemonDataController = pokemonDataController
            self.cordinator = cordinator
            self.pokemons = []
        }
        
        func getPokemonList() {
            pokemonDataController.getPokemonList()
                .map { $0.pokemons ?? []}
                .flatMap { $0.publisher }
                .compactMap { self.getPokemonDetail(for: $0) }
                .flatMap { $0 }
                .collect()
                .sink(receiveCompletion: { print("hAHAHA ERROR:  \($0)") }, receiveValue: { self.pokemons = $0 })
                .store(in: &subscriptions)
        }
        
        func getPokemonImage(with id: Int) -> String {
            pokemonDataController.getPokemonSpriteURL(for: id)
        }
        
        func navigateToPokemonDetail(with id: Int) {
            cordinator.router?.push(cordinator.createPokemonDetailViewController(pokemonId: id), animated: true)
        }
        
        private func getPokemonDetail(for pokemon: Pokemon) -> AnyPublisher<PokemonHomeViewData, APIError> {
            pokemonDataController.getPokemonDetail(for: pokemon.pokemonID)
                .map { PokemonHomeViewData(pokemon: pokemon, type: $0.types.first?.pokemonType ?? .unknown ) }
                .eraseToAnyPublisher()
                
        }
    }
}

struct PokemonHomeViewData: Identifiable {
    var pokemon: Pokemon
    var type: PokemonType
    var id = UUID()
}
