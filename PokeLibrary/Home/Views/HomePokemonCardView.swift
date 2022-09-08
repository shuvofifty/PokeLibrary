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
        CardWithTopImageView(config: CardConfig(), content: {
            Text(pokemonName)
                .bold()
                .font(.system(size: 20))
            Text("\(id)")
        }, imageView: {
            AsyncImageView(url: url)
        })
    }
}

struct HomePokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomePokemonCardView(url: "", pokemonName: "Charmander", id: 2)
    }
}
