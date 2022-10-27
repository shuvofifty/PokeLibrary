//
//  RootViewController.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 10/26/22.
//

import Foundation
import UIKit

class RootViewController: UIViewController {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .foundation(style: .navigationTitle, weight: .regular)
        label.text = "Default"
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
