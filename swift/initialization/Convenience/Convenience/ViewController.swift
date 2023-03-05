//
//  ViewController.swift
//  Convenience
//
//  Created by Brittany Pinder on 2023-03-05.
//

import UIKit

class ViewController: UIViewController {

    let button1 = CustomButton()
    let button2 = CustomButton(color: .systemGreen, title: "Button 2")
    let button3 = CustomButton(color: .systemBlue, title: "Button 3", width: 280, height: 50)

    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .center

        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)

        button1.backgroundColor = .systemRed
        button1.setTitle("Button 1", for: .normal)
        button1.widthAnchor.constraint(equalToConstant: 280).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 50).isActive = true

        button2.widthAnchor.constraint(equalToConstant: 280).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 50).isActive = true

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

