//
//  CategoryView+ViewModel.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import Combine

extension CategoryView {
    class ViewModel: ObservableObject {
        private let pokemonDataController: PokemonDataController
        private let pokemonTypeDataController: PokemonTypeDataController
        @Published var pokemonTypes: [PokemonTypeData] = []
        
        private var subscriptions = Set<AnyCancellable>()
        
        init(pokemonDataController: PokemonDataController, pokemonTypeDataController: PokemonTypeDataController) {
            self.pokemonDataController = pokemonDataController
            self.pokemonTypeDataController = pokemonTypeDataController
        }
        
        func getPokemonTypes() {
            pokemonDataController.getPokemonTypes()
                .map { $0.types }
                .sink { error in
                    print("Error: \(error)")
                } receiveValue: { types in
                    self.pokemonTypes = types
                }
                .store(in: &subscriptions)
        }
    }
}
