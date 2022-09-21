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
            Text((viewModel.pokemonDetailResponse?.name ?? "No Name Found").capitalized)
                .multilineTextAlignment(.trailing)
                .font(.system(size: 40, weight: .bold))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
            HStack {
                AsyncImageView(url: viewModel.getPokemonSpriteURL())
                    .frame(width: 180, height: 180, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
            }
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
    }
}
