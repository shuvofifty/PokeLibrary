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
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.orange)
                    .frame(height: 100)
                Text(type.name.capitalized)
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .onAppear {
            viewModel.getPokemonTypes()
        }
    }
}

struct CategoryBoxCellView: View {
    private let category: String
    
    var body: some View {
        Text("Category")
    }
}
