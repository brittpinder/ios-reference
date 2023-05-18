//
//  ViewController.swift
//  Views
//
//  Created by Brittany Pinder on 2023-05-18.
//

import UIKit

class ViewController: UIViewController {

    var rotation: CGFloat = 0
    var scale: CGFloat = 1

    var blueView = UIView()
    var frameOutline = UIView()

    let sliderStackView = UIStackView()
    let scaleSlider = SliderView(viewModel: SliderView.SliderViewModel(min: 0.1, max: 2, title: "Scale"), initialValue: 1.0)
    let rotationSlider = SliderView(viewModel: SliderView.SliderViewModel(min: 0, max: 2 * .pi, title: "Rotation"), initialValue: 0.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureViews()
        configureSliders()
    }

    func configureViews() {
        blueView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
        blueView.center = CGPoint(x: view.center.x, y: 300)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = .systemBlue
        view.addSubview(blueView)

        frameOutline = UIView(frame: CGRect(x: blueView.frame.origin.x,
                                            y: blueView.frame.origin.y,
                                            width: blueView.frame.size.width,
                                            height: blueView.frame.size.height))
        frameOutline.translatesAutoresizingMaskIntoConstraints = false
        frameOutline.layer.borderColor = UIColor.red.cgColor
        frameOutline.layer.borderWidth = 1
        view.addSubview(frameOutline)
    }

    func configureSliders() {
        scaleSlider.delegate = self
        rotationSlider.delegate = self

        view.addSubview(sliderStackView)
        sliderStackView.addArrangedSubview(scaleSlider)
        sliderStackView.addArrangedSubview(rotationSlider)

        sliderStackView.translatesAutoresizingMaskIntoConstraints = false
        sliderStackView.axis = .vertical
        sliderStackView.spacing = 8

        sliderStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 3).isActive = true
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: sliderStackView.trailingAnchor, multiplier: 3).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: sliderStackView.bottomAnchor, multiplier: 3).isActive = true
    }
}

//MARK: - Actions
extension ViewController {
    private func updateTransform() {
        blueView.transform = CGAffineTransform(rotationAngle: rotation).concatenating(CGAffineTransform(scaleX: scale, y: scale))
    }

    private func updateFrame() {
        frameOutline.frame = CGRect(x: blueView.frame.origin.x,
                                    y: blueView.frame.origin.y,
                                    width: blueView.frame.size.width,
                                    height: blueView.frame.size.height)
    }
}

//MARK: - SliderViewDelegate
extension ViewController: SliderViewDelegate {
    func sliderValueChanged(sliderView: SliderView, value: Float) {
        switch(sliderView) {
        case scaleSlider:
            scale = CGFloat(value)
        case rotationSlider:
            rotation = CGFloat(value)
        default:
            return
        }

        updateTransform()
        updateFrame()

        print("Frame: \(blueView.frame)")
        print("Bounds: \(blueView.bounds)")
    }
}
