//
//  HomeViewController.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/19/22.
//

import Foundation
import UIKit
import SwiftUI
import Factory
import Combine

class HomeViewController: UIViewController {
    enum ViewActions {
        case pokemonCellTap(pokemonId: Int)
    }
    
    private let viewModel: HomeView.ViewModel
    private let contentView: UIHostingController<HomeView>
    
    private let actionPassThrough: PassthroughSubject<ViewActions, Never> = .init()
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(viewModel: HomeView.ViewModel) {
        self.viewModel = viewModel
        self.contentView = UIHostingController(rootView: HomeView(viewModel: self.viewModel, actionPassThrough: actionPassThrough))
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
        NSLayoutConstraint.activate([
            contentView.view.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        viewModel.getPokemonList()
        bindings()
    }
    
    private func bindings() {
        actionPassThrough.receive(on: DispatchQueue.main).sink { action in
            switch action {
            case .pokemonCellTap(let pokemonId):
                self.viewModel.navigateToPokemonDetail(with: pokemonId)
            }
        }
        .store(in: &subscriptions)
    }
}
