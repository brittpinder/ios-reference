//
//  Factories.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-15.
//

import UIKit

func makeView(withColor color: UIColor) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    return view
}

func makeView(color: UIColor, width: CGFloat, height: CGFloat) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color

    view.widthAnchor.constraint(equalToConstant: width).isActive = true
    view.heightAnchor.constraint(equalToConstant: height).isActive = true
    return view
}

func makeLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 50)
    label.textAlignment = .center
    return label
}
