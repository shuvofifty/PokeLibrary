//
//  Cordinator.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import SwiftUI
import Factory

class Cordinator {
    func createHomeViewController() -> HomeViewController {
        let viewModel = HomeView.ViewModel(pokemonDataController: Container.pokemonDataController(), cordinator: self)
        return HomeViewController(viewModel: viewModel)
    }
    
    func createCategoryViewController() -> CategoryViewController {
        let viewModel = CategoryView.ViewModel(pokemonDataController: Container.pokemonDataController(), pokemonTypeDataController: Container.pokemonTypeDataController())
        return CategoryViewController(viewModel: viewModel, cordinator: self)
    }
    
    func createCategoryCellView(typeId: Int, category: String) -> some View {
        let viewModel = CategoryBoxCellView.ViewModel(pokemonDataController: Container.pokemonDataController(), pokemonTypeDataController: Container.pokemonTypeDataController())
        return CategoryBoxCellView(viewModel: viewModel, typeId: typeId, category: category)
    }
    
    func createPokemonDetailView(pokemonId: Int) -> some View {
        PokemonDetailView(
            viewModel: PokemonDetailView.ViewModel(
                pokemonId: pokemonId,
                pokemonDataController: Container.pokemonDataController()
            )
        )
    }
}
