//
//  MainViewController.swift
//  MainViewController
//
//  Created by Brittany Pinder on 2023-03-02.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Main: viewDidLoad")
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Main: viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Main: viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Main: viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Main: viewDidDisappear")
    }
}

extension MainViewController {
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("Main: viewWillLayoutSubviews")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("Main: viewDidLayoutSubviews")
    }
}

extension MainViewController {
    func setupUI() {
        let button = UIButton(type: .system)
        button.configuration = .filled()
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextButtonPressed), for: .primaryActionTriggered)

        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func nextButtonPressed() {
        self.navigationController?.pushViewController(PurpleViewController(), animated: true)
    }
}
