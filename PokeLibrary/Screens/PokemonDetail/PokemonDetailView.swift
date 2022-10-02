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
                pokemonTopCardSection
                    .padding(.bottom, 30)
                
                flavourTextSection
                    .padding(.bottom, 30)

                pokemonTypeSection
                    .padding(.bottom, 30)
                
                pokemonMoveSection
                    .padding(.bottom, 30)
                
                weaknessSection
                    .padding(.bottom, 30)
                
                strengthSection
                    .padding(.bottom, 30)
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal, 20)
        }
    }
    
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
            Text(viewModel.pokemonDetailViewData?.types.count ?? 0 <= 1 ? "Type": "Types")
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
            }
            .padding(.bottom, 5)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 0)), count: 2)) {
                ForEach(viewModel.pokemonDetailViewData?.moves ?? []) { move in
                    MoveCard(
                        name: move.name.replacingOccurrences(of: "-", with: " ").capitalized,
                        type: viewModel.pokemonDetailViewData?.types.first?.pokemonType
                    )
                    .frame(minHeight: 100)
                }
            }
            
            if viewModel.pokemonDetailViewData?.shouldShowMoreMove ?? false {
                Button("Show More") {
                    print("More")
                }
                .buttonStyle(SecondaryButtonStyle())
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
    
    private var weaknessSection: some View {
        VStack(alignment: .leading) {
            Text("Weakness")
                .modifier(HeadingModifier(textColor: viewModel.pokemonDetailViewData?.types.first?.pokemonType.getColorCombo().primary ?? .black))
            
            if let weaknesses = viewModel.pokemonDetailViewData?.weakness {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(weaknesses) { weaknessType in
                            Image(weaknessType.type.getIconString())
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                }
            }
        }
    }
    
    private var strengthSection: some View {
        VStack(alignment: .leading) {
            Text("Strong Against")
                .modifier(HeadingModifier(textColor: viewModel.pokemonDetailViewData?.types.first?.pokemonType.getColorCombo().primary ?? .black))
            
            if let weaknesses = viewModel.pokemonDetailViewData?.strength {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(weaknesses) { weaknessType in
                            Image(weaknessType.type.getIconString())
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                }
            }
        }
    }
    
    private var flavourTextSection: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .modifier(HeadingModifier(textColor: viewModel.pokemonDetailViewData?.types.first?.pokemonType.getColorCombo().primary ?? .black))
            
            Text("Hahaha this is an amazing description i have no idea whats going on. Maybe there will be an something i dk")
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
