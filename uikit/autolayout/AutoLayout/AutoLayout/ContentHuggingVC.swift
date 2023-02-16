//
//  ContentHuggingVC.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-16.
//

import UIKit

class ContentHuggingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        let label1 = makeLabel(withText: "Hello")
        let label2 = makeLabel(withText: "World")

        label1.backgroundColor = .systemPurple
        label2.backgroundColor = .systemGreen

        view.addSubview(label1)
        view.addSubview(label2)

        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label1.bottomAnchor.constraint(equalTo: label2.topAnchor),

            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        print(label1.contentHuggingPriority(for: .vertical)) // 250
        print(label2.contentHuggingPriority(for: .vertical)) // 250

        print(label1.contentCompressionResistancePriority(for: .vertical)) // 750
        print(label2.contentCompressionResistancePriority(for: .vertical)) // 750

        label2.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
        //label1.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical) // This works too
    }
}

