//
//  PokemonDetailView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/14/22.
//

import SwiftUI
import QGrid

struct PokemonDetailView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                PokemonDetailTopCardView(
                    config:
                        PokemonDetailTopCardView.Config(
                            imageURL: viewModel.getPokemonSpriteURL(),
                            pokemonName: (viewModel.pokemonDetailResponse?.name ?? "No Name Found").capitalized,
                            height: viewModel.pokemonDetailResponse?.height ?? 0.0,
                            weight: viewModel.pokemonDetailResponse?.weight ?? 0.0,
                            type: viewModel.pokemonDetailResponse?.types.first?.pokemonType ?? .unknown
                        )
                )
                .padding(.bottom, 30)
                
                Text("Types")
                    .modifier(HeadingModifier(textColor: viewModel.pokemonDetailResponse?.types.first?.pokemonType.getColorCombo().primary ?? .black))
                    .padding(.bottom, 5)
                HStack {
                    ForEach(viewModel.pokemonDetailResponse?.types ?? []) { type in
                        Image(type.pokemonType.getIconString())
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
                .padding(.bottom, 30)
                
                Text("Moves")
                    .modifier(HeadingModifier(textColor: viewModel.pokemonDetailResponse?.types.first?.pokemonType.getColorCombo().primary ?? .black))
                    .padding(.bottom, 5)
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 0)), count: 2)) {
                    ForEach(viewModel.pokemonDetailResponse?.moves ?? []) { move in
                        Text(move.name)
                            .font(.system(size: 14))
                            .padding(10)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(viewModel.pokemonDetailResponse?.types.first?.pokemonType.getColorCombo().primary ?? .black)
                            .foregroundColor(viewModel.pokemonDetailResponse?.types.first?.pokemonType.getColorCombo().secondary ?? .white)
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal, 20)
        }
    }
}

struct HeadingModifier: ViewModifier {
    var textColor: Color = .black
    
    func body(content: Content) -> some View {
        content
            .font(PokeFont.shared.globalFont(30).bold())
            .foregroundColor(textColor)
    }
}
