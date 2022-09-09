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
        var subscriptions = Set<AnyCancellable>()
        
        @Published var pokemons: [Pokemon]
        
        init(pokemonDataController: PokemonDataController) {
            self.pokemonDataController = pokemonDataController
            self.pokemons = []
        }
        
        func getPokemonList() {
            pokemonDataController.getPokemonList()
                .sink(receiveCompletion: { print("hAHAHA ERROR:  \($0)") }, receiveValue: { homeData in
                    self.pokemons = homeData.pokemons ?? []
                })
                .store(in: &subscriptions)
        }
        
        func getPokemonImage(with id: Int) -> String {
            pokemonDataController.getPokemonSpriteURL(for: id)
        }
    }
}

