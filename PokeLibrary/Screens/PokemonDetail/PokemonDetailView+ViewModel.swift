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
        private var pokemonDataController: PokemonDataController
        private var pokemonId: Int
        
        init(pokemonId: Int, pokemonDataController: PokemonDataController) {
            self.pokemonId = pokemonId
            self.pokemonDataController = pokemonDataController
        }
        
        func getPokemonDetail() {
            
        }
    }
}
