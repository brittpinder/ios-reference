//
//  CustomButton.swift
//  Convenience
//
//  Created by Brittany Pinder on 2023-03-05.
//

import UIKit

class CustomButton: UIButton {

    // Designated Initializer: calls superclass designated initializer
    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }

    // Convenience Initializer: Calls designated initializer
    convenience init(color: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = color
        self.setTitle(title, for: .normal)
    }

    // Convenience Initializer: Calls convenience initializer
    convenience init(color: UIColor, title: String, width: CGFloat, height: CGFloat) {
        self.init(color: color, title: title)
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
