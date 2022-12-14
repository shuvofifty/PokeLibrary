//
//  CategoryViewController.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/19/22.
//

import Foundation
import UIKit
import SwiftUI
import Factory

class CategoryViewController: UIViewController {
    private let contentView: UIHostingController<CategoryView>
    private let viewModel: CategoryView.ViewModel
    private let cordinator: CategoryCordinator
    
    init(viewModel: CategoryView.ViewModel, cordinator: CategoryCordinator) {
        self.viewModel = viewModel
        self.cordinator = cordinator
        self.contentView = UIHostingController(rootView: CategoryView(cordinator: self.cordinator, viewModel: self.viewModel))
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "Category"
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
        
        viewModel.getPokemonTypes()
    }
}
