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
    
    private var pokemonTopCardSection: some View {
        PokemonDetailTopCardView(
            config:
                PokemonDetailTopCardView.Config(
                    imageURL: viewModel.getPokemonSpriteURL(),
                    pokemonName: (viewModel.pokemonDetailViewData?.name ?? "No Name Found").capitalized,
                    height: viewModel.pokemonDetailViewData?.height ?? 0.0,
                    weight: viewModel.pokemonDetailViewData?.weight ?? 0.0,
                    type: viewModel.pokemonDetailViewData?.types.first?.pokemonType ?? .unknown
                )
        )
    }
    
    private var pokemonTypeSection: some View {
        VStack(alignment: .leading) {
            Text("Types")
                .modifier(HeadingModifier(textColor: viewModel.pokemonDetailViewData?.types.first?.pokemonType.getColorCombo().primary ?? .black))
                .padding(.bottom, 5)
            
            HStack {
                ForEach(viewModel.pokemonDetailViewData?.types ?? []) { type in
                    Image(type.pokemonType.getIconString())
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
    
    private var pokemonMoveSection: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Moves")
                    .modifier(HeadingModifier(textColor: viewModel.pokemonDetailViewData?.types.first?.pokemonType.getColorCombo().primary ?? .black))
                    .fixedSize(horizontal: false, vertical: true)
                if viewModel.pokemonDetailViewData?.shouldShowMoreMove ?? false {
                    Spacer()
                    
                    Button("More") {
                        print("More")
                    }
                    .buttonStyle(SecondaryButtonStyle())
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .fixedSize(horizontal: true, vertical: true)
                }
            }
            .padding(.bottom, 5)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 0)), count: 2)) {
                ForEach(viewModel.pokemonDetailViewData?.moves ?? []) { move in
                    Text(move.name)
                        .font(.system(size: 14))
                        .padding(10)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(viewModel.pokemonDetailViewData?.types.first?.pokemonType.getColorCombo().primary ?? .black)
                        .foregroundColor(viewModel.pokemonDetailViewData?.types.first?.pokemonType.getColorCombo().secondary ?? .white)
                }
            }
            
            if viewModel.pokemonDetailViewData?.shouldShowMoreMove ?? false {
                Button("More") {
                    print("More")
                }
                .buttonStyle(SecondaryButtonStyle())
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                pokemonTopCardSection
                    .padding(.bottom, 30)

                pokemonTypeSection
                    .padding(.bottom, 30)
                
                pokemonMoveSection
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
