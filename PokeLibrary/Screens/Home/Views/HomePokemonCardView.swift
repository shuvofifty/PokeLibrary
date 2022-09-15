//
//  HomePokemonCardView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/8/22.
//

import Foundation
import SwiftUI

struct HomePokemonCardView: View {
    @EnvironmentObject var cordinator: Cordinator
    @State private var isPokemonDetailViewActive = false
    var url: String
    var pokemonName: String
    var id: Int
    
    var body: some View {
        ZStack {
            cordinator.registerNav(for: { cordinator.createPokemonDetailView() }, isActive: $isPokemonDetailViewActive)
            
            CircleWithLabelView(config: CircleWithLabelView.Config(), imageView: {
                AsyncImageView(url: url)
            }, labelView: {
                Text(pokemonName)
                    .bold()
            })
            .onTapGesture {
                self.isPokemonDetailViewActive = true
            }
        }
        
    }
}

struct HomePokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomePokemonCardView(url: "", pokemonName: "Charmander", id: 2)
    }
}
