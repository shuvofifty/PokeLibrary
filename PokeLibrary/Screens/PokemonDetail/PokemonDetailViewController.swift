//
//  PokemonDetailViewController.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/19/22.
//

import Foundation
import UIKit
import SwiftUI

class PokemonDetailViewController: UIViewController {
    private let viewModel: PokemonDetailView.ViewModel
    private let contentView: UIHostingController<PokemonDetailView>
    
    init(viewModel: PokemonDetailView.ViewModel) {
        self.viewModel = viewModel
        self.contentView = UIHostingController(rootView: PokemonDetailView(viewModel: self.viewModel))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(contentView)
        view.addSubview(contentView.view)
        contentView.view.JRL_SetToParent(view, top: 0, right: 0, bottom: 0, left: 0)
        
        viewModel.getPokemonDetail()
    }
}
