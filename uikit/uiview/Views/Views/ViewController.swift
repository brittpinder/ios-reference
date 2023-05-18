//
//  ViewController.swift
//  Views
//
//  Created by Brittany Pinder on 2023-05-18.
//

import UIKit

class ViewController: UIViewController {

    var translationX: CGFloat = 0
    var translationY: CGFloat = 0
    var rotation: CGFloat = 0
    var scale: CGFloat = 1

    var blueView = UIView()
    var frameOutline = UIView()
    var frameLabel = UILabel()
    var boundsLabel = UILabel()

    let sliderStackView = UIStackView()
    let translationXSlider = SliderView(viewModel: SliderView.SliderViewModel(min: -100, max: 100, title: "Translation X"), initialValue: 0)
    let translationYSlider = SliderView(viewModel: SliderView.SliderViewModel(min: -100, max: 100, title: "Translation Y"), initialValue: 0)
    let scaleSlider = SliderView(viewModel: SliderView.SliderViewModel(min: 0.1, max: 2, title: "Scale"), initialValue: 1.0)
    let rotationSlider = SliderView(viewModel: SliderView.SliderViewModel(min: -.pi, max: .pi, title: "Rotation"), initialValue: 0.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureView()
        configureDebugComponents()
        configureSliders()
    }

    private func configureView() {
        blueView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
        blueView.center = CGPoint(x: view.center.x, y: 300)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = .systemBlue
        view.addSubview(blueView)
    }

    private func configureDebugComponents() {
        frameOutline.translatesAutoresizingMaskIntoConstraints = false
        frameOutline.layer.borderColor = UIColor.red.cgColor
        frameOutline.layer.borderWidth = 1
        view.addSubview(frameOutline)

        frameLabel.text = "Frame"
        frameLabel.font = UIFont.systemFont(ofSize: 12)
        frameLabel.textColor = UIColor.red
        frameLabel.numberOfLines = -1
        frameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(frameLabel)

        boundsLabel.text = "Bounds"
        boundsLabel.font = UIFont.systemFont(ofSize: 12)
        boundsLabel.textColor = .systemBlue
        boundsLabel.numberOfLines = -1
        boundsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(boundsLabel)

        NSLayoutConstraint.activate([
            frameLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            frameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            boundsLabel.topAnchor.constraint(equalTo: frameLabel.topAnchor),
            boundsLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 12)
        ])

        updateDebugInfo()
    }

    private func configureSliders() {
        translationXSlider.delegate = self
        translationYSlider.delegate = self
        scaleSlider.delegate = self
        rotationSlider.delegate = self

        view.addSubview(sliderStackView)
        sliderStackView.addArrangedSubview(translationXSlider)
        sliderStackView.addArrangedSubview(translationYSlider)
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
        blueView.transform = CGAffineTransform(translationX: translationX, y: translationY).concatenating(CGAffineTransform(rotationAngle: rotation)).concatenating(CGAffineTransform(scaleX: scale, y: scale))
    }

    private func updateDebugInfo() {
        frameOutline.frame = CGRect(x: blueView.frame.origin.x,
                                    y: blueView.frame.origin.y,
                                    width: blueView.frame.size.width,
                                    height: blueView.frame.size.height)

        let frameX = Int(blueView.frame.origin.x)
        let frameY = Int(blueView.frame.origin.y)
        let frameWidth = Int(blueView.frame.width)
        let frameHeight = Int(blueView.frame.height)

        frameLabel.text = "Frame\nx: \(frameX)\ny: \(frameY)\nwidth: \(frameWidth)\nheight: \(frameHeight)"

        let boundsX = Int(blueView.bounds.origin.x)
        let boundsY = Int(blueView.bounds.origin.y)
        let boundsWidth = Int(blueView.bounds.width)
        let boundsHeight = Int(blueView.bounds.height)

        boundsLabel.text = "Bounds\nx: \(boundsX)\ny: \(boundsY)\nwidth: \(boundsWidth)\nheight: \(boundsHeight)"
    }
}

//MARK: - SliderViewDelegate
extension ViewController: SliderViewDelegate {
    func sliderValueChanged(sliderView: SliderView, value: Float) {
        switch(sliderView) {
        case translationXSlider:
            translationX = CGFloat(value)
        case translationYSlider:
            translationY = CGFloat(value)
        case scaleSlider:
            scale = CGFloat(value)
        case rotationSlider:
            rotation = CGFloat(value)
        default:
            return
        }

        updateTransform()
        updateDebugInfo()
    }
}
