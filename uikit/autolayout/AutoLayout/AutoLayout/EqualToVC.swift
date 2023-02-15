//
//  EqualToVC.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-15.
//

import UIKit

class EqualToVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        let blue = makeView(withColor: .systemBlue)
        let red = makeView(withColor: .systemRed)
        view.addSubview(blue)
        view.addSubview(red)

        blue.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        blue.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blue.widthAnchor.constraint(equalToConstant: 200).isActive = true
        blue.heightAnchor.constraint(equalTo: blue.widthAnchor).isActive = true

        red.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        red.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        red.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        red.heightAnchor.constraint(equalTo: blue.heightAnchor).isActive = true
    }
}
