//
//  IntrinsicVC.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-16.
//

import UIKit

class IntrinsicVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        let label = UILabel()
        label.text = "Hello World"
        label.backgroundColor = .systemYellow
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)

        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        print(label.intrinsicContentSize) // (88.0, 20.33)
    }
}
