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
        ZStack(alignment: .bottom) {
            AsyncImageView(url: url)
                .padding(10)
                .clipShape(Circle())
                .overlay(Circle().stroke(.black, lineWidth: 5))
                .padding(10)
            Text(pokemonName)
                .padding(5)
                .background(Color.black)
                .foregroundColor(.white)
        }
        
        
    }
}

struct HomePokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomePokemonCardView(url: "", pokemonName: "Charmander", id: 2)
    }
}
