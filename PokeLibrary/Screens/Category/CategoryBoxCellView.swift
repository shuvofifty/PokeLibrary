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
    @StateObject var viewModel: ViewModel
    let typeId: Int
    let category: String
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImageView(url: self.viewModel.imageUrl)
                Text(category)
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
        .onAppear {
            self.viewModel.getTypeDetails(for: self.typeId)
        }
    }
}

extension CategoryBoxCellView {
    class ViewModel: ObservableObject {
        @Published var imageUrl: String = ""
        private let pokemonDataController: PokemonDataController
        private let pokemonTypeDataController: PokemonTypeDataController
        
        private var subscriptions = Set<AnyCancellable>()
        
        init(pokemonDataController: PokemonDataController, pokemonTypeDataController: PokemonTypeDataController) {
            self.pokemonDataController = pokemonDataController
            self.pokemonTypeDataController = pokemonTypeDataController
        }
        
        func getTypeDetails(for id: Int) {
            pokemonTypeDataController.getCategoryDetail(for: id)
                .sink { error in
                    print("Error: \(error)")
                } receiveValue: { response in
                    self.imageUrl = self.pokemonDataController.getPokemonSpriteURL(for: response.pokemons.first?.pokemonID ?? -1)
                }
                .store(in: &subscriptions)
        }
    }
}
