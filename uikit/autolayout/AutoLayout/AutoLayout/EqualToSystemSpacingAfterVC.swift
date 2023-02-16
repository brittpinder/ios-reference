//
//  EqualToSystemSpacingAfterVC.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-16.
//

import UIKit

class EqualToSystemSpacingAfterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        let orange = makeView(withColor: .systemOrange)
        view.addSubview(orange)

        orange.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2).isActive = true
        orange.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2).isActive = true
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: orange.trailingAnchor, multiplier: 2).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: orange.bottomAnchor, multiplier: 2).isActive = true
    }
}
