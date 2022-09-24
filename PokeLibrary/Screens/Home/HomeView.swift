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
            QGrid(viewModel.pokemons, columns: 2) { data in
                ZStack {
                    HomePokemonCardView(
                        url: viewModel.getPokemonImage(with: data.pokemon.pokemonID),
                        pokemonName: (data.pokemon.name).capitalized,
                        id: data.pokemon.pokemonID,
                        pokemontypeColorCombo: data.type.getColorCombo()
                    )
                    .frame(maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .onTapGesture {
                        actionPassThrough.send(.pokemonCellTap(pokemonId: data.pokemon.pokemonID))
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}
