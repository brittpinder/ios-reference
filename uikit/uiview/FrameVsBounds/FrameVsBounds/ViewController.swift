//
//  ViewController.swift
//  Views
//
//  Created by Brittany Pinder on 2023-05-18.
//

import UIKit

class ViewController: UIViewController {

    var translationX: CGFloat {
        didSet {
            translationXSlider.setValue(Float(translationX))
        }
    }
    var translationY: CGFloat {
        didSet {
            translationYSlider.setValue(Float(translationY))
        }
    }
    var rotation: CGFloat {
        didSet {
            rotationSlider.setValue(Float(rotation))
        }
    }
    var scale: CGFloat {
        didSet {
            scaleSlider.setValue(Float(scale))
        }
    }

    var greenView = UIView()
    var frameOutline = UIView()
    var frameLabel = UILabel()
    var boundsLabel = UILabel()

    let sliderStackView = UIStackView()

    let translationXSlider = SliderView(viewModel: SliderView.ViewModel(min: -100, max: 100, title: "Translation X"), initialValue: 0, roundingType: .nearestInt)
    let translationYSlider = SliderView(viewModel: SliderView.ViewModel(min: -100, max: 100, title: "Translation Y"), initialValue: 0, roundingType: .nearestInt)
    let scaleSlider = SliderView(viewModel: SliderView.ViewModel(min: 0, max: 2, title: "Scale"), initialValue: 1.0, roundingType: .nearestHundredth)
    let rotationSlider = SliderView(viewModel: SliderView.ViewModel(min: -.pi, max: .pi, title: "Rotation"), initialValue: 0.0, roundingType: .nearestHundredth)

    let resetButton = UIButton(type: .system)

    init() {
        self.translationX = 0
        self.translationY = 0
        self.rotation = 0
        self.scale = 1
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureView()
        configureDebugComponents()
        configureSliders()
        configureResetButton()
    }

    private func configureView() {
        greenView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
        greenView.center = CGPoint(x: view.center.x, y: 300)
        greenView.backgroundColor = .systemGreen
        view.addSubview(greenView)
    }

    private func configureDebugComponents() {
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
        boundsLabel.textColor = .systemGreen
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
        sliderStackView.alignment = .center
        sliderStackView.spacing = 16

        NSLayoutConstraint.activate([
            sliderStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 3),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: sliderStackView.trailingAnchor, multiplier: 3),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: sliderStackView.bottomAnchor, multiplier: 3),

            translationXSlider.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor),
            translationYSlider.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor),
            scaleSlider.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor),
            rotationSlider.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor),
        ])
    }

    private func configureResetButton() {
        resetButton.setTitle("Reset", for: .normal)
        resetButton.tintColor = .white
        resetButton.backgroundColor = .systemBlue
        resetButton.clipsToBounds = true
        resetButton.layer.cornerRadius = 5
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .primaryActionTriggered)

        sliderStackView.addArrangedSubview(resetButton)

        resetButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

//MARK: - Actions
extension ViewController {
    private func updateTransform() {
        greenView.transform = CGAffineTransform(translationX: translationX, y: translationY).concatenating(CGAffineTransform(rotationAngle: rotation)).concatenating(CGAffineTransform(scaleX: scale, y: scale))

        updateDebugInfo()
    }

    private func updateDebugInfo() {
        frameOutline.frame = CGRect(x: greenView.frame.origin.x,
                                    y: greenView.frame.origin.y,
                                    width: greenView.frame.size.width,
                                    height: greenView.frame.size.height)

        let frameX = Int(greenView.frame.origin.x)
        let frameY = Int(greenView.frame.origin.y)
        let frameWidth = Int(greenView.frame.width)
        let frameHeight = Int(greenView.frame.height)

        frameLabel.text = "Frame\nx: \(frameX)\ny: \(frameY)\nwidth: \(frameWidth)\nheight: \(frameHeight)"

        let boundsX = Int(greenView.bounds.origin.x)
        let boundsY = Int(greenView.bounds.origin.y)
        let boundsWidth = Int(greenView.bounds.width)
        let boundsHeight = Int(greenView.bounds.height)

        boundsLabel.text = "Bounds\nx: \(boundsX)\ny: \(boundsY)\nwidth: \(boundsWidth)\nheight: \(boundsHeight)"
    }

    @objc private func resetButtonPressed() {
        translationX = 0
        translationY = 0
        scale = 1
        rotation = 0
        updateTransform()
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
    }
}
