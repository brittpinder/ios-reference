//
//  MainViewController.swift
//  MainViewController
//
//  Created by Brittany Pinder on 2023-03-02.
//

import UIKit

class MainViewController: UIViewController {

    init() {
        print("Main: init")
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        print("Main: loadView")
        super.loadView()
    }

    override func viewDidLoad() {
        print("Main: viewDidLoad")
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Main: viewWillAppear")
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        print("Main: viewDidAppear")
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("Main: viewWillDisappear")
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("Main: viewDidDisappear")
        super.viewDidDisappear(animated)
    }

    deinit {
        print("Main: deinit")
    }
}

extension MainViewController {
    override func viewWillLayoutSubviews() {
        print("Main: viewWillLayoutSubviews")
        super.viewWillLayoutSubviews()

    }

    override func viewDidLayoutSubviews() {
        print("Main: viewDidLayoutSubviews")
        super.viewDidLayoutSubviews()
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
        print("\nNext Button Pressed\n")

        self.navigationController?.pushViewController(PurpleViewController(), animated: true)
    }
}
