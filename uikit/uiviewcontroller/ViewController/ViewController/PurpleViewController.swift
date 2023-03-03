//
//  PurpleViewController.swift
//  ViewController
//
//  Created by Brittany Pinder on 2023-03-02.
//

import UIKit

class PurpleViewController: UIViewController {

    init() {
        print("Purple: init")
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        print("Purple: loadView")
        super.loadView()
    }

    override func viewDidLoad() {
        print("Purple: viewDidLoad")
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Purple: viewWillAppear")
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        print("Purple: viewDidAppear")
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("Purple: viewWillDisappear")
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("Purple: viewDidDisappear")
        super.viewDidDisappear(animated)
    }

    deinit {
        print("Purple: deinit")
    }
}

extension PurpleViewController {
    override func viewWillLayoutSubviews() {
        print("Purple: viewWillLayoutSubviews")
        super.viewWillLayoutSubviews()
    }

    override func viewDidLayoutSubviews() {
        print("Purple: viewDidLayoutSubviews")
        super.viewDidLayoutSubviews()
    }
}

extension PurpleViewController {
    func setupUI() {
        let button = UIButton(type: .system)
        button.configuration = .filled()
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .primaryActionTriggered)

        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func backButtonPressed() {
        print("\nBack Button Pressed\n")
        self.navigationController?.popToRootViewController(animated: true)
    }
}
