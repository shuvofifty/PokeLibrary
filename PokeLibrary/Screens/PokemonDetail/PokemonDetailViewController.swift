//
//  PokemonDetailViewController.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/19/22.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class PokemonDetailViewController: RootViewController {
    private let viewModel: PokemonDetailView.ViewModel
    private let scrollViewOffsetValueSubject: CurrentValueSubject<CGFloat, Never>
    private let contentView: UIHostingController<PokemonDetailView>
    private var subscriptions = Set<AnyCancellable>()
    
    private lazy var navTitleView: UIHostingController<PokemonDetailNavTitle> = {
        let hosting = UIHostingController(
            rootView: PokemonDetailNavTitle(
                pokemonName: viewModel.pokemonDetailViewData?.name ?? "",
                pokemonImageURL: viewModel.getPokemonSpriteURL(),
                textColor: viewModel.pokemonDetailViewData?.types.first?.pokemonType.getColorCombo().secondary ?? .clear
            )
        )
        hosting.view.backgroundColor = .clear
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        return hosting
    }()
    
    init(viewModel: PokemonDetailView.ViewModel) {
        self.viewModel = viewModel
        self.scrollViewOffsetValueSubject = CurrentValueSubject<CGFloat, Never>(0)
        self.contentView = UIHostingController(rootView: PokemonDetailView(viewModel: self.viewModel, scrollViewOffSetSubject: scrollViewOffsetValueSubject))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(contentView)
        view.addSubview(contentView.view)
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.view.JRL_SetToParent(view, top: 0, right: 0, bottom: 0, left: 0)
        view.backgroundColor = .white
        
        viewModel.getPokemonDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.text = "Hahahah"
        scrollViewOffsetValueSubject.sink { offset in
            self.setNavBarConfig(offSet: offset)
        }
        .store(in: &subscriptions)
    }
    
    private func setNavBarConfig(offSet: CGFloat) {
        if offSet > 100 {
            navigationItem.titleView = navTitleView.view
            navigationController?.navigationBar.barTintColor = UIColor(viewModel.pokemonDetailViewData?.types.first?.pokemonType.getColorCombo().primary ?? .clear)
            
        } else {
            navigationItem.titleView = titleLabel
            titleLabel.text = "Pokemon Detail"
        }
    }
}

struct PokemonDetailNavTitle: View {
    var pokemonName: String
    var pokemonImageURL: String
    var textColor: Color
    
    var body: some View {
        HStack {
            AsyncImageView(url: pokemonImageURL)
                .frame(width: 30, height: 30, alignment: .center)
            Text(pokemonName)
                .font(.foundation(style: .navigationTitle).bold())
                .foregroundColor(textColor)
        }
        .frame(minHeight: 0, maxHeight: .infinity)
    }
}
