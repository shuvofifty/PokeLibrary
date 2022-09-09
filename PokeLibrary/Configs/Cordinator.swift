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
        return HomeView(viewModel: viewModel)
    }
    
    func createCategoryView() -> some View {
        let viewModel = CategoryView.ViewModel(pokemonDataController: Container.pokemonDataController())
        return CategoryView(viewModel: viewModel)
    }
}
