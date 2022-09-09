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
    
    var body: some View {
        CircleWithLabelView(config: CircleWithLabelView.Config(), imageView: {
            AsyncImageView(url: url)
        }, labelView: {
            Text(pokemonName)
                .bold()
        })
    }
}

struct HomePokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomePokemonCardView(url: "", pokemonName: "Charmander", id: 2)
    }
}