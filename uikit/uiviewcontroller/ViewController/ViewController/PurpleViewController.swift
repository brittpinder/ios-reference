//
//  PurpleViewController.swift
//  ViewController
//
//  Created by Brittany Pinder on 2023-03-02.
//

import UIKit

class PurpleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        print("Purple: viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Purple: viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Purple: viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Purple: viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Purple: viewDidDisappear")
    }
}

extension PurpleViewController {
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("Purple: viewWillLayoutSubviews")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("Purple: viewDidLayoutSubviews")
    }
}
