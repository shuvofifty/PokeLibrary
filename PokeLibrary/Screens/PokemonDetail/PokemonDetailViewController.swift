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
        
        titleLabel.text = ""
        scrollViewOffsetValueSubject.sink { offset in
            print("Scrolled: \(offset)")
        }
        .store(in: &subscriptions)
    }
}
