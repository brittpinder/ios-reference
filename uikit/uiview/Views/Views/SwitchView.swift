//
//  SwitchView.swift
//  Views
//
//  Created by Brittany Pinder on 2023-05-18.
//

import UIKit

protocol SwitchViewDelegate: AnyObject {
    func switchToggled(switchView: SwitchView, value: Bool)
}

class SwitchView: UIView {

    let title: String

    weak var delegate: SwitchViewDelegate?

    let stackView = UIStackView()
    let label = UILabel()
    let switchControl = UISwitch()

    init(title: String, initialValue: Bool) {
        self.title = title
        super.init(frame: .zero)

        setup()
        layout()

        switchControl.setOn(initialValue, animated: false)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(stackView)

        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(switchControl)

        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        label.text = title
        label.font = UIFont.systemFont(ofSize: 14)

        switchControl.addTarget(self, action: #selector(switchToggled), for: .primaryActionTriggered)
    }

    private func layout() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

//MARK: - Actions
extension SwitchView {
    @objc private func switchToggled() {
        delegate?.switchToggled(switchView: self, value: switchControl.isOn)
    }

    func setValue(_ value: Bool) {
        switchControl.setOn(value, animated: true)
    }
}
