//
//  Cordinator.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import SwiftUI
import Factory

class Cordinator: ObservableObject {
    func createHomeView() -> some View {
        let viewModel = HomeView.ViewModel(pokemonDataController: Container.pokemonDataController())
        return NavigationView{ HomeView(viewModel: viewModel) }
    }
    
    func createCategoryView() -> some View {
        let viewModel = CategoryView.ViewModel(pokemonDataController: Container.pokemonDataController(), pokemonTypeDataController: Container.pokemonTypeDataController())
        return CategoryView(viewModel: viewModel)
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
    
    func createNav<T: View>(for view: () -> T, isActive: Binding<Bool>) -> some View {
        NavigationLink("_", isActive: isActive) {
            view()
        }
        .hidden()
    }
}
