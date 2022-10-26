//
//  MoveCardView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 10/1/22.
//

import Foundation
import SwiftUI

extension PokemonDetailView {
    struct MoveCard: View {
        var name: String
        var type: PokemonType?
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(type?.getColorCombo().primary ?? .black)
                
                Text(name)
                    .font(.foundation(style: .body))
                    .padding(10)
                    .foregroundColor(type?.getColorCombo().secondary ?? .white)
            }
        }
    }
}

struct PokemonDetailView_ViewProvider: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.MoveCard(name: "Test move", type: .normal)
    }
}
