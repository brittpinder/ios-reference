//
//  ImageViewController.swift
//  Views
//
//  Created by Brittany Pinder on 2023-05-18.
//

import UIKit

class ImageViewController: UIViewController {

    static let defaultImageWidth = 100
    static let defaultImageHeight = 125

    var imageClipsToBounds: Bool {
        didSet {
            clipsSwitch.setValue(imageClipsToBounds)
        }
    }
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
    var boundsX: CGFloat {
        didSet {
            boundsXSlider.setValue(Float(boundsX))
        }
    }
    var boundsY: CGFloat {
        didSet {
            boundsYSlider.setValue(Float(boundsY))
        }
    }
    var boundsWidth: CGFloat {
        didSet {
            boundsWidthSlider.setValue(Float(boundsWidth))
        }
    }
    var boundsHeight: CGFloat {
        didSet {
            boundsHeightSlider.setValue(Float(boundsHeight))
        }
    }

    var containerView = UIView()
    var imageView = UIImageView()
    var frameOutline = UIView()
    var frameLabel = UILabel()
    var boundsLabel = UILabel()

    let clipsSwitch = SwitchView(title: "Clips to Bounds", initialValue: true)

    let sliderStackView = UIStackView()
    let translationXSlider = SliderView(viewModel: SliderView.ViewModel(min: Float(-defaultImageWidth), max: Float(defaultImageWidth), title: "Translation X"), initialValue: 0, roundingType: .nearestInt)
    let translationYSlider = SliderView(viewModel: SliderView.ViewModel(min: Float(-defaultImageHeight), max: Float(defaultImageHeight), title: "Translation Y"), initialValue: 0, roundingType: .nearestInt)
    let scaleSlider = SliderView(viewModel: SliderView.ViewModel(min: 0, max: 2, title: "Scale"), initialValue: 1.0, roundingType: .nearestHundredth)
    let rotationSlider = SliderView(viewModel: SliderView.ViewModel(min: -.pi, max: .pi, title: "Rotation"), initialValue: 0.0, roundingType: .nearestHundredth)
    let boundsXSlider = SliderView(viewModel: SliderView.ViewModel(min: Float(-defaultImageWidth), max: Float(defaultImageWidth), title: "Bounds X"), initialValue: 0, roundingType: .nearestInt)
    let boundsYSlider = SliderView(viewModel: SliderView.ViewModel(min: Float(-defaultImageHeight), max: Float(defaultImageHeight), title: "Bounds Y"), initialValue: 0, roundingType: .nearestInt)
    let boundsWidthSlider = SliderView(viewModel: SliderView.ViewModel(min: 0, max: Float(defaultImageWidth * 2), title: "Bounds Width"), initialValue: Float(defaultImageWidth), roundingType: .nearestInt)
    let boundsHeightSlider = SliderView(viewModel: SliderView.ViewModel(min: 0, max: Float(defaultImageHeight * 2), title: "Bounds Height"), initialValue: Float(defaultImageHeight), roundingType: .nearestInt)

    let resetButton = UIButton(type: .system)

    init() {
        self.imageClipsToBounds = true
        self.translationX = 0
        self.translationY = 0
        self.rotation = 0
        self.scale = 1
        self.boundsX = 0
        self.boundsY = 0
        self.boundsWidth = CGFloat(ImageViewController.defaultImageWidth)
        self.boundsHeight = CGFloat(ImageViewController.defaultImageHeight)
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
        configureClipsSwitch()
        configureSliders()
        configureResetButton()
    }

    private func configureView() {
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

    private func configureSliders() {
        translationXSlider.delegate = self
        translationYSlider.delegate = self
        scaleSlider.delegate = self
        rotationSlider.delegate = self
        boundsXSlider.delegate = self
        boundsYSlider.delegate = self
        boundsWidthSlider.delegate = self
        boundsHeightSlider.delegate = self

        view.addSubview(sliderStackView)
        sliderStackView.addArrangedSubview(translationXSlider)
        sliderStackView.addArrangedSubview(translationYSlider)
        sliderStackView.addArrangedSubview(scaleSlider)
        sliderStackView.addArrangedSubview(rotationSlider)
        sliderStackView.addArrangedSubview(boundsXSlider)
        sliderStackView.addArrangedSubview(boundsYSlider)
        sliderStackView.addArrangedSubview(boundsWidthSlider)
        sliderStackView.addArrangedSubview(boundsHeightSlider)

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
            boundsXSlider.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor),
            boundsYSlider.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor),
            boundsWidthSlider.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor),
            boundsHeightSlider.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor),
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
extension ImageViewController {
    private func updateImage() {
        containerView.transform = CGAffineTransform(translationX: translationX, y: translationY).concatenating(CGAffineTransform(rotationAngle: rotation)).concatenating(CGAffineTransform(scaleX: scale, y: scale))

        containerView.bounds = CGRect(x: boundsX, y: boundsY, width: boundsWidth, height: boundsHeight)
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
        translationX = 0
        translationY = 0
        scale = 1
        rotation = 0
        boundsX = 0
        boundsY = 0
        boundsWidth = CGFloat(ImageViewController.defaultImageWidth)
        boundsHeight = CGFloat(ImageViewController.defaultImageHeight)
        updateImage()
    }
}

//MARK: - SliderViewDelegate
extension ImageViewController: SliderViewDelegate {
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
        case boundsXSlider:
            boundsX = CGFloat(value)
        case boundsYSlider:
            boundsY = CGFloat(value)
        case boundsWidthSlider:
            boundsWidth = CGFloat(value)
        case boundsHeightSlider:
            boundsHeight = CGFloat(value)
        default:
            return
        }

        updateImage()
    }
}

extension ImageViewController: SwitchViewDelegate {
    func switchToggled(switchView: SwitchView, value: Bool) {
        imageClipsToBounds = value
        updateImage()
    }
}
