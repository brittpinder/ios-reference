//
//  ViewController.swift
//  StackView
//
//  Created by Brittany Pinder on 2023-02-16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill // Change this to see different behaviour
        stackView.distribution = .fill // Change this to see different behaviour

        let red = makeView(color: .systemRed, width: 50, height: 50)
        let blue = makeView(color: .systemBlue, width: 100, height: 100)
        let green = makeView(color: .systemGreen, width: 200, height: 200)

        view.addSubview(stackView)
        stackView.addArrangedSubview(red)
        stackView.addArrangedSubview(blue)
        stackView.addArrangedSubview(green)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])


    }
}

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
