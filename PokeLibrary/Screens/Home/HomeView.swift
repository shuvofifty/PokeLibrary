//
//  HomeView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import SwiftUI
import QGrid

struct HomeView: View {
    @StateObject var viewModel: ViewModel
    @EnvironmentObject private var cordinator: Cordinator
    
    var body: some View {
        ZStack {
            QGrid(viewModel.pokemons, columns: 2) { pokemon in
                HomePokemonCardView(
                    url: viewModel.getPokemonImage(with: pokemon.pokemonID),
                    pokemonName: (pokemon.name).capitalized,
                    id: pokemon.pokemonID
                )
                .frame(maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
            .onAppear {
                viewModel.getPokemonList()
            }
            .navigationTitle("Home")
        }
    }
}
