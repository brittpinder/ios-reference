//
//  ImageViewController.swift
//  Views
//
//  Created by Brittany Pinder on 2023-05-18.
//

import UIKit

class ImageViewController: UIViewController {

    enum ViewAttribute: Int {
        case translationX = 0
        case translationY
        case scale
        case rotation
        case boundsX
        case boundsY
        case boundsWidth
        case boundsHeight
    }

    class SliderBinding {
        let initialValue: CGFloat
        var value: CGFloat {
            didSet {
                sliderView.setValue(Float(value))
            }
        }
        let sliderView: SliderView

        init(initialValue: CGFloat, sliderView: SliderView) {
            self.initialValue = initialValue
            self.value = initialValue
            self.sliderView = sliderView
        }

        func reset() {
            value = initialValue
        }
    }

    static let defaultImageWidth = 100
    static let defaultImageHeight = 125

    private let sliderData: [(attribute: ViewAttribute, initialValue: Float, min: Float, max: Float, title: String, roundingType: SliderView.RoundingType)] = [
        (attribute: .translationX, initialValue: 0, min: Float(-defaultImageWidth), max: Float(defaultImageWidth), title: "Translation X", roundingType: .nearestInt),
        (attribute: .translationY, initialValue: 0, min: Float(-defaultImageHeight), max: Float(defaultImageHeight), title: "Translation Y", roundingType: .nearestInt),
        (attribute: .scale, initialValue: 1, min: 0, max: 2, title: "Scale", roundingType: .nearestHundredth),
        (attribute: .rotation, initialValue: 0, min: -.pi, max: .pi, title: "Rotation", roundingType: .nearestHundredth),
        (attribute: .boundsX, initialValue: 0, min: Float(-defaultImageWidth), max: Float(defaultImageWidth), title: "Bounds X", roundingType: .nearestInt),
        (attribute: .boundsY, initialValue: 0, min: Float(-defaultImageHeight), max: Float(defaultImageHeight), title: "Bounds Y", roundingType: .nearestInt),
        (attribute: .boundsWidth, initialValue: Float(defaultImageWidth), min: 0, max: Float(defaultImageWidth) * 2, title: "Bounds Width", roundingType: .nearestInt),
        (attribute: .boundsHeight, initialValue: Float(defaultImageHeight), min: 0, max: Float(defaultImageHeight) * 2, title: "Bounds Height", roundingType: .nearestInt)
    ]

    var imageClipsToBounds: Bool {
        didSet {
            clipsSwitch.setValue(imageClipsToBounds)
        }
    }

    var containerView = UIView()
    var imageView = UIImageView()
    var frameOutline = UIView()
    var frameLabel = UILabel()
    var boundsLabel = UILabel()
    let clipsSwitch = SwitchView(title: "Clips to Bounds", initialValue: true)
    let resetButton = UIButton(type: .system)

    var sliders = [ViewAttribute: SliderBinding]()

    init() {
        self.imageClipsToBounds = true

        for data in sliderData {
            let sliderView = SliderView(viewModel: SliderView.ViewModel(min: data.min, max: data.max, title: data.title), initialValue: Float(data.initialValue), roundingType: data.roundingType)

            sliders[data.attribute] = SliderBinding(initialValue: CGFloat(data.initialValue), sliderView: sliderView)
        }

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureImage()
        configureDebugComponents()
        configureClipsSwitch()
        configureResetButton()
        configureSliders()
    }

    private func configureImage() {
        containerView = UIView(frame: CGRect(x: 0, y: 0, width: ImageViewController.defaultImageWidth, height: ImageViewController.defaultImageHeight))
        containerView.center = CGPoint(x: view.center.x, y: 270)
        containerView.backgroundColor = .systemGreen
        view.addSubview(containerView)

        imageView = UIImageView(image: UIImage(named: "dog.jpeg")!)
        imageView.frame.size = CGSize(width: containerView.frame.width, height: containerView.frame.height)
        containerView.addSubview(imageView)
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

    private func configureClipsSwitch() {
        view.addSubview(clipsSwitch)

        clipsSwitch.delegate = self
        clipsSwitch.translatesAutoresizingMaskIntoConstraints = false
        clipsSwitch.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1).isActive = true
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: clipsSwitch.trailingAnchor, multiplier: 1).isActive = true
    }

    private func configureResetButton() {
        resetButton.setTitle("Reset", for: .normal)
        resetButton.tintColor = .white
        resetButton.backgroundColor = .systemBlue
        resetButton.clipsToBounds = true
        resetButton.layer.cornerRadius = 5
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .primaryActionTriggered)
        resetButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(resetButton)

        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 100),
            resetButton.heightAnchor.constraint(equalToConstant: 40),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: resetButton.bottomAnchor, multiplier: 2)
        ])
    }

    private func configureSliders() {
        for item in sliders {
            sliders[item.key]!.sliderView.delegate = self
        }

        let sliderStackView = UIStackView()
        sliderStackView.translatesAutoresizingMaskIntoConstraints = false
        sliderStackView.axis = .horizontal
        sliderStackView.distribution = .fillEqually
        sliderStackView.spacing = 16
        view.addSubview(sliderStackView)

        let halfIndex = Int(Float(Float(sliders.count) / 2.0).rounded())

        let sv1 = UIStackView()
        for index in 0..<halfIndex {
            sv1.addArrangedSubview(sliders[ViewAttribute(rawValue: index)!]!.sliderView)
        }
        sv1.axis = .vertical
        sv1.spacing = 16
        sliderStackView.addArrangedSubview(sv1)

        let sv2 = UIStackView()
        for index in halfIndex..<sliders.count {
            sv2.addArrangedSubview(sliders[ViewAttribute(rawValue: index)!]!.sliderView)
        }
        sv2.axis = .vertical
        sv2.spacing = 16
        sliderStackView.addArrangedSubview(sv2)

        NSLayoutConstraint.activate([
            sliderStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 3),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: sliderStackView.trailingAnchor, multiplier: 3),
            sliderStackView.bottomAnchor.constraint(equalTo: resetButton.topAnchor, constant: -16)
        ])
    }
}

//MARK: - Actions
extension ImageViewController {
    private func updateImage() {

        containerView.transform = CGAffineTransform(translationX: sliders[.translationX]!.value, y: sliders[.translationY]!.value).concatenating(CGAffineTransform(rotationAngle: sliders[.rotation]!.value)).concatenating(CGAffineTransform(scaleX: sliders[.scale]!.value, y: sliders[.scale]!.value))

        containerView.bounds = CGRect(x: sliders[.boundsX]!.value, y: sliders[.boundsY]!.value, width: sliders[.boundsWidth]!.value, height: sliders[.boundsHeight]!.value)
        containerView.clipsToBounds = imageClipsToBounds

        updateDebugInfo()
    }

    private func updateDebugInfo() {
        frameOutline.frame = CGRect(x: containerView.frame.origin.x,
                                    y: containerView.frame.origin.y,
                                    width: containerView.frame.size.width,
                                    height: containerView.frame.size.height)

        let frameX = Int(containerView.frame.origin.x)
        let frameY = Int(containerView.frame.origin.y)
        let frameWidth = Int(containerView.frame.width)
        let frameHeight = Int(containerView.frame.height)

        frameLabel.text = "Frame\nx: \(frameX)\ny: \(frameY)\nwidth: \(frameWidth)\nheight: \(frameHeight)"

        let boundsX = Int(containerView.bounds.origin.x)
        let boundsY = Int(containerView.bounds.origin.y)
        let boundsWidth = Int(containerView.bounds.width)
        let boundsHeight = Int(containerView.bounds.height)

        boundsLabel.text = "Bounds\nx: \(boundsX)\ny: \(boundsY)\nwidth: \(boundsWidth)\nheight: \(boundsHeight)"
    }

    @objc private func resetButtonPressed() {
        imageClipsToBounds = true

        for item in sliders {
            sliders[item.key]!.reset()
        }

        updateImage()
    }
}

//MARK: - SliderViewDelegate
extension ImageViewController: SliderViewDelegate {
    func sliderValueChanged(sliderView: SliderView, value: Float) {
        if let item = sliders.first(where: {$0.value.sliderView == sliderView}) {
            sliders[item.key]!.value = CGFloat(value)
            updateImage()
            return
        }
    }
}

extension ImageViewController: SwitchViewDelegate {
    func switchToggled(switchView: SwitchView, value: Bool) {
        imageClipsToBounds = value
        updateImage()
    }
}
