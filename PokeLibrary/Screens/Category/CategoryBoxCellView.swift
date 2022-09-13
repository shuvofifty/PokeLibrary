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
            RoundedRectangle(cornerRadius: 25)
                .fill(.orange)
                .frame(height: 100)
            VStack {
                AsyncImageView(url: self.viewModel.imageUrl)
                    .frame(width: 30, height: 30, alignment: .center)
                Text(category)
                    .bold()
                    .foregroundColor(.white)
            }
        }
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
