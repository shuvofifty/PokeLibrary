//
//  HomeView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import SwiftUI
import QGrid
import Combine

struct HomeView: View {
    @StateObject var viewModel: ViewModel
    var actionPassThrough: PassthroughSubject<HomeViewController.ViewActions, Never>
    
    var body: some View {
        ZStack {
            QGrid(viewModel.pokemons, columns: 2) { pokemon in
                ZStack {
                    HomePokemonCardView(
                        url: viewModel.getPokemonImage(with: pokemon.pokemonID),
                        pokemonName: (pokemon.name).capitalized,
                        id: pokemon.pokemonID
                    )
                    .frame(maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .onTapGesture {
                        actionPassThrough.send(.pokemonCellTap(pokemonId: pokemon.pokemonID))
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}
