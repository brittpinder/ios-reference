//
//  SimpleViewController.swift
//  FrameVsBounds
//
//  Created by Brittany Pinder on 2023-05-19.
//

import UIKit

class SimpleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let rectangle = UIView(frame: CGRect(x: 100, y: 100, width: 150, height: 150))
        rectangle.backgroundColor = .systemGreen
        view.addSubview(rectangle)

        print("Frame: \(rectangle.frame)")
        print("Bounds: \(rectangle.bounds)")
    }
}
