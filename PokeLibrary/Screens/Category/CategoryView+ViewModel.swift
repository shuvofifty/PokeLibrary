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
        @Published var pokemonTypes: [PokemonTypeData] = []
        
        private var subscriptions = Set<AnyCancellable>()
        
        init(pokemonDataController: PokemonDataController) {
            self.pokemonDataController = pokemonDataController
        }
        
        func getPokemonTypes() {
            pokemonDataController.getPokemonTypes()
                .sink { error in
                    print("Error: \(error)")
                } receiveValue: { response in
                    self.pokemonTypes = response.types
                    print(self.pokemonTypes)
                }
                .store(in: &subscriptions)

        }
    }
}
