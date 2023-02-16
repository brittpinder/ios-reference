//
//  EqualToMultiplierConstantVC.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-15.
//

import UIKit

class EqualToMultiplierConstantVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        let red = makeView(color: .systemRed, width: 50, height: 50)
        let blue = makeView(withColor: .systemBlue)

        view.addSubview(red)
        view.addSubview(blue)

        red.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        red.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        blue.topAnchor.constraint(equalTo: red.bottomAnchor, constant: 8).isActive = true
        blue.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blue.widthAnchor.constraint(equalTo: red.widthAnchor, multiplier: 2, constant: 10).isActive = true
        blue.heightAnchor.constraint(equalTo: red.heightAnchor, multiplier: 3, constant: 20).isActive = true
    }

}
