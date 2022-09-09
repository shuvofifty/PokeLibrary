//
//  HomeView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import SwiftUI
import QGrid

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
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
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
