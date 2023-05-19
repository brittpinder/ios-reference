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

    enum RoundingType {
        case nearestInt, nearestHundredth
    }

    struct ViewModel {
        var min: Float
        var max: Float
        var title: String
    }

    let viewModel: ViewModel
    let roundingType: RoundingType

    weak var delegate: SliderViewDelegate?

    let stackView = UIStackView()
    let label = UILabel()
    let slider = UISlider()

    init(viewModel: ViewModel, initialValue: Float, roundingType: RoundingType) {
        self.viewModel = viewModel
        self.roundingType = roundingType
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

        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: 14)
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
        label.text = "\(viewModel.title): \(getRoundedValue())"
    }

    func setValue(_ value: Float) {
        slider.setValue(value, animated: true)
        updateLabel()
    }

    private func getRoundedValue() -> any Numeric {
        switch roundingType {
        case .nearestInt:
            return Int(slider.value)
        case .nearestHundredth:
            return round(slider.value * 100) / 100.0
        }
    }
}
