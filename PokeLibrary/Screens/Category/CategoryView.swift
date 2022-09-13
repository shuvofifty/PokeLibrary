//
//  CategoryView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import QGrid
import SwiftUI
import Combine

struct CategoryView: View {
    @EnvironmentObject var cordinator: Cordinator
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        QGrid(viewModel.pokemonTypes, columns: 2) {type in
            return cordinator.createCategoryCellView(typeId: type.typeId, category: type.name)
        }
        .onAppear {
            viewModel.getPokemonTypes()
        }
    }
}
