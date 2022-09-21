//
//  PokemonDetailView+ViewModel.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/14/22.
//

import Foundation
import Combine

extension PokemonDetailView {
    class ViewModel: ObservableObject {
        private var subscriptions = Set<AnyCancellable>()
        private var pokemonDataController: PokemonDataController
        private var pokemonId: Int
        
        @Published var pokemonDetailResponse: PokemonDetailResponse?
        
        init(pokemonId: Int, pokemonDataController: PokemonDataController) {
            self.pokemonId = pokemonId
            self.pokemonDataController = pokemonDataController
        }
        
        func getPokemonDetail() {
            pokemonDataController.getPokemonDetail(for: pokemonId)
                .sink(receiveCompletion: { print("Error: \($0)") }, receiveValue: { self.pokemonDetailResponse = $0 })
                .store(in: &subscriptions)
        }
        
        func getPokemonSpriteURL() -> String {
            pokemonDataController.getPokemonSpriteURL(for: pokemonId)
        }
    }
}
