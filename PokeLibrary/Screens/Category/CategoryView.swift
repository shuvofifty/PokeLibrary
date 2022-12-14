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
    var cordinator: CategoryCordinator
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        QGrid(viewModel.pokemonTypes, columns: 2) {data in
            return cordinator.rootCordinator.viewFactory.createCategoryCellView(typeId: data.typeId, category: data.type)
        }
    }
}
