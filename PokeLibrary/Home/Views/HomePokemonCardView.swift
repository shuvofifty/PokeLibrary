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
        ZStack(alignment: .top) {
            Color.clear
                .frame(height: 150)
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.orange)
                .padding(.top, 40)
            VStack(alignment: .center) {
                AsyncImageView(url: url)
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding(10)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.orange, lineWidth: 10))
                
                Text(pokemonName)
                    .bold()
                    .font(.system(size: 20))
                Text("\(id)")
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
        }
        
    }
}

struct HomePokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomePokemonCardView(url: "", pokemonName: "Charmander", id: 2)
    }
}
