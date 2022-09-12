//
//  CategoryView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import QGrid
import SwiftUI

struct CategoryView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        QGrid(viewModel.pokemonTypes, columns: 2) {type in
            return CategoryBoxCellView(category: type.name.capitalized)
                .onAppear {
                    viewModel.getPokemonTypeImage(id: type.typeId)
                }
        }
        .onAppear {
            viewModel.getPokemonTypes()
        }
    }
}

struct CategoryBoxCellView: View {
    let category: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.orange)
                .frame(height: 100)
            Text(category)
                .bold()
                .foregroundColor(.white)
        }
    }
}
