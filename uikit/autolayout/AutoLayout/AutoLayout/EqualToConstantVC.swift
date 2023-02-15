//
//  EqualToConstantVC.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-15.
//

import UIKit

class EqualToConstantVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        let red = makeView(color: .systemRed, width: 100, height: 100)
        let blue = makeView(withColor: .systemBlue)
        let green = makeView(color: .systemGreen, width: 100, height: 100)
        let yellow = makeView(color: .systemYellow, width: 100, height: 100)

        view.addSubview(red)
        view.addSubview(blue)
        view.addSubview(green)
        view.addSubview(yellow)

        red.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        red.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

        blue.topAnchor.constraint(equalTo: red.bottomAnchor, constant: 20).isActive = true
        blue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        blue.widthAnchor.constraint(equalTo: red.widthAnchor, constant: 40).isActive = true
        blue.heightAnchor.constraint(equalTo: red.heightAnchor, constant: 40).isActive = true

        green.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        green.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true

        yellow.trailingAnchor.constraint(equalTo: green.leadingAnchor, constant: -20).isActive = true
        yellow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        yellow.widthAnchor.constraint(equalTo: green.widthAnchor, constant: 40).isActive = true
        yellow.heightAnchor.constraint(equalTo: green.heightAnchor, constant: 40).isActive = true
    }

}
