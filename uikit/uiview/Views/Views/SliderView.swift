//
//  SliderView.swift
//  Views
//
//  Created by Brittany Pinder on 2023-05-18.
//

import UIKit

protocol SliderViewDelegate: AnyObject {
    func sliderValueChanged(sliderView: SliderView, value: Float)
}

class SliderView: UIView {

    struct SliderViewModel {
        var min: Float
        var max: Float
        var title: String
    }

    let viewModel: SliderViewModel

    weak var delegate: SliderViewDelegate?

    let stackView = UIStackView()
    let label = UILabel()
    let slider = UISlider()

    init(viewModel: SliderViewModel, initialValue: Float) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        setup()
        layout()

        slider.setValue(initialValue, animated: false)
        updateLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(stackView)

        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(slider)

        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false

        updateLabel()

        slider.minimumValue = viewModel.min
        slider.maximumValue = viewModel.max
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }

    private func layout() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            slider.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}

//MARK: - Actions
extension SliderView {
    @objc private func sliderValueChanged() {
        updateLabel()
        delegate?.sliderValueChanged(sliderView: self, value: slider.value)
    }

    private func updateLabel() {
        let roundedValue = round(slider.value * 100) / 100.0
        label.text = "\(viewModel.title): \(roundedValue)"
    }
}
