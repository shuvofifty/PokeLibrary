//
//  Cordinator.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import SwiftUI

class Cordinator: ObservableObject {
    
    private let apiPaths = APIProdPathImp()
    private let networking = NetworkingImp()
    
    func createHomeView() -> some View {
        let viewModel = HomeView.ViewModel(pokemonDataController: PokemonDataControllerImp(apiPath: apiPaths, networking: networking))
        return HomeView(viewModel: viewModel)
    }
    
    func createCategoryView() -> some View {
        let viewModel = CategoryView.ViewModel()
        return CategoryView(viewModel: viewModel)
    }
}
