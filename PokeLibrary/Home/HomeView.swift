//
//  HomeView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel(
        pokemonDataController: PokemonDataControllerImp(
            apiPath: APIProdPathImp(),
            networking: NetworkingImp()
        )
    )
    
    var body: some View {
        List(viewModel.pokemons) { pokemon in
            HStack {
                AsyncImageView(url: viewModel.getPokemonImage(with: pokemon.pokemonID))
                    .frame(width: 100, height: 100, alignment: .center)
                VStack(alignment: .leading) {
                    Text((pokemon.name).capitalized)
                        .bold()
                    Text("Pokemon ID: \(pokemon.pokemonID)")
                }
            }
            
        }
        .listStyle(PlainListStyle())
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
