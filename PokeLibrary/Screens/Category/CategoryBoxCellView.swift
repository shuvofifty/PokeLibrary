//
//  CategoryBoxCellView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/13/22.
//

import Foundation
import SwiftUI
import Combine

struct CategoryBoxCellView: View {
    let typeId: Int
    let type: PokemonType
    
    var body: some View {
        ZStack {
            VStack {
                Image(type.getIconString())
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                Text(type.getName())
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(.orange)
                    .padding(.top, 20)
            }
            .padding(25)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(.orange, lineWidth: 5))
        }
        .padding(2.5)
        .frame(maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
