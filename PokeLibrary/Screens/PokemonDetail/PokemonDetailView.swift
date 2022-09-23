//
//  PokemonDetailView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/14/22.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            PokemonDetailTopCardView(
                config:
                    PokemonDetailTopCardView.Config(
                        imageURL: viewModel.getPokemonSpriteURL(),
                        pokemonName: (viewModel.pokemonDetailResponse?.name ?? "No Name Found").capitalized,
                        height: viewModel.pokemonDetailResponse?.height ?? 0,
                        weight: viewModel.pokemonDetailResponse?.height ?? 0
                    )
            )
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
    }
}
