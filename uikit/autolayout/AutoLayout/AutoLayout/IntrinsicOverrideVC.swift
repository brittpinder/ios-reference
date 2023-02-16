//
//  IntrinsicOverrideVC.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-16.
//

import UIKit

class IntrinsicOverrideVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        let customView = CustomView()
        customView.backgroundColor = .systemIndigo
        customView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(customView)

        customView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        customView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

class CustomView: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300, height: 200)
    }
}
