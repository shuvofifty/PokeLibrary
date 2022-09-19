//
//  HomePokemonCardView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/8/22.
//

import Foundation
import SwiftUI

struct HomePokemonCardView: View {
    var url: String
    var pokemonName: String
    var id: Int
    
    @State private var isPokemonDetailViewActive = false
    
    var body: some View {
        ZStack {
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
