//
//  LayoutHelper.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/19/22.
//

import Foundation
import UIKit

extension UIView {
    func JRL_SetToParent(_ view: UIView, top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: right).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: left).isActive = true
        }
    }
}
