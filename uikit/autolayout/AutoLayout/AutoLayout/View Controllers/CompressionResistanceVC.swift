//
//  CompressionResistanceVC.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-16.
//

import UIKit

class CompressionResistanceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        let label1 = makeLabel(text: "This is a blue label", color: .systemMint)
        let label2 = makeLabel(text: "This is an orange label", color: .systemOrange)

        view.addSubview(label1)
        view.addSubview(label2)

        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label1.trailingAnchor.constraint(equalTo: label2.leadingAnchor),

            label2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label2.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        label1.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 751), for: .horizontal)
        //label2.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .horizontal) // This works too
    }

    func makeLabel(text: String, color: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = color
        label.font = .systemFont(ofSize: 25)
        return label
    }

}
