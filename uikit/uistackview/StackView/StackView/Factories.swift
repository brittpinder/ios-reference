//
//  Factories.swift
//  StackView
//
//  Created by Brittany Pinder on 2023-02-17.
//

import UIKit

class CustomView: UIView {
    let intrinsicWidth: Int
    let intrinsicHeight: Int

    init(width: Int, height: Int) {
        self.intrinsicWidth = width
        self.intrinsicHeight = height
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: intrinsicWidth, height: intrinsicHeight)
    }
}

func makeView(color: UIColor, width: Int, height: Int) -> UIView {
    let view = CustomView(width: width, height: height)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color

    return view
}
