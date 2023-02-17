//
//  AxisSpacingVC.swift
//  StackView
//
//  Created by Brittany Pinder on 2023-02-17.
//

import UIKit

class AxisSpacingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20

        let red = makeView(color: .systemRed, width: 75, height: 75)
        let blue = makeView(color: .systemBlue, width: 75, height: 75)
        let green = makeView(color: .systemGreen, width: 75, height: 75)

        view.addSubview(stackView)
        stackView.addArrangedSubview(red)
        stackView.addArrangedSubview(blue)
        stackView.addArrangedSubview(green)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
