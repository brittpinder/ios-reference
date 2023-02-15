//
//  CornersVC.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-15.
//

import UIKit

class CornersVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let blue = makeView(color: .systemBlue, width: 100, height: 100)
        let red = makeView(color: .systemRed, width: 100, height: 100)
        let yellow = makeView(color: .systemYellow, width: 100, height: 100)
        let green = makeView(color: .systemGreen, width: 100, height: 100)

        view.addSubview(blue)
        view.addSubview(red)
        view.addSubview(yellow)
        view.addSubview(green)

        blue.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blue.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

        red.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        red.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        yellow.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        yellow.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

        green.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        green.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    

    func makeView(color: UIColor, width: CGFloat, height: CGFloat) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color

        view.widthAnchor.constraint(equalToConstant: width).isActive = true
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }

}
