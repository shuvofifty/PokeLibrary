//
//  HomeView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel(pokemonDataController: PokemonDataControllerImp(apiPath: APIProdPathImp(), networking: NetworkingImp()))
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                viewModel.getPokemonList()
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
