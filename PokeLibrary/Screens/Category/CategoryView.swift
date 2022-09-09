//
//  CategoryView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import SwiftUI

struct CategoryView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Text("Category")
            .onAppear {
                viewModel.getPokemonTypes()
            }
    }
}
