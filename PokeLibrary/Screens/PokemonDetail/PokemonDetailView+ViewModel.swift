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
        private var pokemonTypeDataController: PokemonTypeDataController
        private var pokemonId: Int
        
        @Published var pokemonDetailViewData: PokemonDetailViewController.ViewData?
        
        init(pokemonId: Int, pokemonDataController: PokemonDataController, pokemonTypeDataController: PokemonTypeDataController) {
            self.pokemonId = pokemonId
            self.pokemonDataController = pokemonDataController
            self.pokemonTypeDataController = pokemonTypeDataController
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
                .sink(receiveCompletion: { print("Error: \($0)") }, receiveValue: {
                    self.pokemonDetailViewData = $0
                    self.setWeakness()
                })
                .store(in: &subscriptions)
        }
        
        func getPokemonSpriteURL() -> String {
            pokemonDataController.getPokemonSpriteURL(for: pokemonId)
        }
        
        private func setWeakness() {
            (pokemonDetailViewData!.types)
                .publisher
                .compactMap { pokemonTypeDataController.getCategoryDetail(for: $0.typeId).map{$0.doubleDamageFrom}.eraseToAnyPublisher() }
                .flatMap { $0 }
                .collect()
                .eraseToAnyPublisher()
                .replaceError(with: [])
                .sink {pokemonTypesArr in
                    var typeSet: Set<PokemonTypeStruct> = []
                    for pokemonTypes in pokemonTypesArr {
                        for pokemonType in pokemonTypes {
                            typeSet.insert(pokemonType)
                        }
                    }
                    self.pokemonDetailViewData?.weakness = Array(typeSet)
                }
                .store(in: &subscriptions)
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
        var weakness: [PokemonTypeStruct]?
    }
}
