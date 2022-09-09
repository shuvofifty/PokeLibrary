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
        let viewModel = HomeViewModel(pokemonDataController: PokemonDataControllerImp(apiPath: apiPaths, networking: networking))
        return HomeView(viewModel: viewModel)
    }
}
