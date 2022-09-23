//
//  PokemonDetailTopCardView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/23/22.
//

import SwiftUI

struct PokemonDetailTopCardView: View {
    var config: Config
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(config.pokemonName)
                .multilineTextAlignment(.trailing)
                .font(.system(size: 28, weight: .bold))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
            HStack {
                AsyncImageView(url: config.imageURL)
                    .frame(width: 150, height: 150, alignment: .center)
                Spacer()
                VStack(alignment: .trailing, spacing: 10) {
                    Text("Height: \(config.height) ft")
                    Text("Weight: \(config.weight) lbs")
                }
                
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
        }
        .background(.green)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 4)
        )
        .padding([.top, .horizontal])
        
    }
    
    struct Config {
        var imageURL: String
        var pokemonName: String
        var height: Int
        var weight: Int
        
    }
}

struct PokemonDetailTopCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailTopCardView(config: PokemonDetailTopCardView.Config(imageURL: "random", pokemonName: "Bulbasaur", height: 20, weight: 300))
    }
}
