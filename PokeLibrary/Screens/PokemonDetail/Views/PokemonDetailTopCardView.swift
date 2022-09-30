//
//  PokemonDetailTopCardView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/23/22.
//

import SwiftUI

struct PokemonDetailTopCardView: View {
    var config: Config
    var lineWidth: CGFloat = 6
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(config.pokemonName)
                .foregroundColor(config.type.getColorCombo().secondary)
                .multilineTextAlignment(.trailing)
                .font(PokeFont.shared.globalFont(35).bold())
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
            HStack {
                AsyncImageView(url: config.imageURL)
                    .frame(width: 150, height: 150, alignment: .center)
                Spacer()
                VStack(alignment: .trailing, spacing: 10) {
                    Text("Height: \(Int(config.height)) ft")
                        .font(PokeFont.shared.globalFont(18))
                        .foregroundColor(config.type.getColorCombo().secondary)
                    Text("Weight: \(Int(config.weight)) lbs")
                        .font(PokeFont.shared.globalFont(18))
                        .foregroundColor(config.type.getColorCombo().secondary)
                }
                
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
        }
        .background(config.type.getColorCombo().primary.opacity(0.7))
        .cornerRadius(15)
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(config.type.getColorCombo().primary, lineWidth: lineWidth)
        )
        .padding(EdgeInsets(top: lineWidth/2, leading: lineWidth/2, bottom: lineWidth/2, trailing: lineWidth/2))
        
    }
    
    struct Config {
        var imageURL: String
        var pokemonName: String
        var height: Double
        var weight: Double
        var type: PokemonType
    }
}

struct PokemonDetailTopCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailTopCardView(config: PokemonDetailTopCardView.Config(imageURL: "random", pokemonName: "Bulbasaur", height: 20.0, weight: 300.0, type: .unknown))
    }
}
