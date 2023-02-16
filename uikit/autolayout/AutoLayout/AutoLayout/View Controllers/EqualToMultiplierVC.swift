//
//  EqualToMultiplierVC.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-15.
//

import UIKit

class EqualToMultiplierVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        let purple = makeView(withColor: .systemPurple)
        view.addSubview(purple)

        purple.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        purple.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        purple.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        purple.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
}
