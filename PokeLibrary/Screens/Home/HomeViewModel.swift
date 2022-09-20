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
        public private(set) var cordinator: Cordinator
        var subscriptions = Set<AnyCancellable>()
        
        @Published var pokemons: [Pokemon]
        
        init(pokemonDataController: PokemonDataController, cordinator: Cordinator) {
            self.pokemonDataController = pokemonDataController
            self.cordinator = cordinator
            self.pokemons = []
        }
        
        func getPokemonList() {
            pokemonDataController.getPokemonList()
                .map { $0.pokemons ?? [] }
                .sink(receiveCompletion: { print("hAHAHA ERROR:  \($0)") }, receiveValue: { self.pokemons = $0 })
                .store(in: &subscriptions)
        }
        
        func getPokemonImage(with id: Int) -> String {
            pokemonDataController.getPokemonSpriteURL(for: id)
        }
    }
}

