//
//  ViewController.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-15.
//

import UIKit

class FrameVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        let view1 = UIView(frame: CGRect(x: 20, y: 100, width: 200, height: 100))
        view1.translatesAutoresizingMaskIntoConstraints = true
        view1.backgroundColor = .systemMint
        view.addSubview(view1)

        let view2 = UIView(frame: CGRect(x: 200, y: 400, width: 150, height: 250))
        view2.translatesAutoresizingMaskIntoConstraints = true
        view2.backgroundColor = .systemPink
        view.addSubview(view2)
    }
}

