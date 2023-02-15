//
//  AnchorVC.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-15.
//

import UIKit

class CenterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        let rectangle = UIView()
        rectangle.backgroundColor = .systemMint
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rectangle)

//        rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        rectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        rectangle.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        rectangle.heightAnchor.constraint(equalToConstant: 100).isActive = true

        NSLayoutConstraint.activate([
            rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rectangle.widthAnchor.constraint(equalToConstant: 200),
            rectangle.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
