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
        
        @Published var pokemonDetailViewData: PokemonDetailViewController.ViewData?
        
        init(pokemonId: Int, pokemonDataController: PokemonDataController) {
            self.pokemonId = pokemonId
            self.pokemonDataController = pokemonDataController
        }
        
        func getPokemonDetail() {
            pokemonDataController.getPokemonDetail(for: pokemonId)
                .map { resp -> PokemonDetailViewController.ViewData in
                    var data = PokemonDetailViewController.ViewData(
                        height: resp.height ?? 0.0,
                        moves: [],
                        name: resp.name ?? "",
                        weight: resp.weight ?? 0.0,
                        types: resp.types,
                        shouldShowMoreMove: false
                    )
                    
                    var moves: [PokemonDetailResponse.Move] = []
                    for (index, move) in (resp.moves ?? []).enumerated() {
                        if index == 6 {
                            data.shouldShowMoreMove = true
                            break
                        }
                        moves.append(move)
                    }
                    data.moves = moves
                    
                    return data
                }
                .sink(receiveCompletion: { print("Error: \($0)") }, receiveValue: { self.pokemonDetailViewData = $0 })
                .store(in: &subscriptions)
        }
        
        func getPokemonSpriteURL() -> String {
            pokemonDataController.getPokemonSpriteURL(for: pokemonId)
        }
    }
}

extension PokemonDetailViewController {
    struct ViewData {
        var height: Double
        var moves: [PokemonDetailResponse.Move]
        var name: String
        var weight: Double
        var types: [PokemonDetailResponse.PokemonTypeBranchStruct]
        var shouldShowMoreMove: Bool
    }
}
