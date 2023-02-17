# UIStackView

## Distribution and Alignment

### Distribution

* **Fill**
	* The default setting
	* Fills all of the available space along the stackview's axis
	* Tries to respect the intrinsic content size of inner views but will stretch some if necessary to fill the space
	* Use CHCR to indicate to Auto Layout which views should stretch if needed
* **Fill Equally**
	* Fills the space by making all controls the same size (along the stackview's axis)
	* Does not respect intrinsic content size of the inner views
* **Fill Proportionally**
	* Fills the space along the stackview's axis but respects the relative proportions of the inner views' intrinsic sizes
	* All inner views will stretch proportionally
* **Equal Spacing**
	* Fills the available space with equal spacing between each inner view
	* Inner views are not stretched and retain their intrinsic content size
* **Equal Centering**
	* Similar to equal spacing in that inner views retain their intrinsic content size and space is added between inner views instead of stretching them
	* The space between each inner view is not necessarily equal. Rather, the distance between the center position of each inner view is the same


### Alignment

* **Fill**
* **Leading (vertical axis)**
* **Trailing (vertical axis)**
* **Center**
* **Bottom (horizontal axis)**
* **Top (horizontal axis)**

### StackViews with Fixed Size

In the below table, each stack view is pinned to the edges of the safe area, giving the stack view a fixed size. Three views have been placed inside the stackview: a red view with an intrinsic size of (50, 50), a blue view with an intrinsic size of (100, 100) and a green view with an intrinsic size of (200, 200). Since the stackview's size is larger than its combined inner views, the inner views need to stretch or position themselves to fill the available space. The distribution and alignment settings will dictate how they do this.

```swift
let stackView = UIStackView()
stackView.translatesAutoresizingMaskIntoConstraints = false
stackView.axis = .vertical
stackView.alignment = .fill // Change this to see different behaviour
stackView.distribution = .fill // Change this to see different behaviour

let red = makeView(color: .systemRed, width: 50, height: 50)
let blue = makeView(color: .systemBlue, width: 100, height: 100)
let green = makeView(color: .systemGreen, width: 200, height: 200)

view.addSubview(stackView)
stackView.addArrangedSubview(red)
stackView.addArrangedSubview(blue)
stackView.addArrangedSubview(green)

NSLayoutConstraint.activate([
    stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
])
```

Distribution ↓ / Alignment → | Fill | Leading | Center | Trailing | Notes
---|---|---|---|---|---
**Fill** | ![](images/size/fill_fill.png) | ![](images/size/leading_fill.png) | ![](images/size/center_fill.png) | ![](images/size/trailing_fill.png) | The stack view overrides the intrinsic heigh of the red view and stretches it to fill the space. Changing the content hugging priority of the inner views would allow us to control which inner view gets stretched
**Fill Equally** | ![](images/size/fill_fillEqually.png) | ![](images/size/leading_fillEqually.png) | ![](images/size/center_fillEqually.png) | ![](images/size/trailing_fillEqually.png) | The stack view overrides the intrinsic height of all the inner views and gives them equal height to fill the space
**Fill Proportionally** | ![](images/size/fill_fillProportionally.png) | ![](images/size/leading_fillProportionally.png) | ![](images/size/center_fillProportionally.png) | ![](images/size/trailing_fillProportionally.png) | Each inner view is stretched to fill the space, but they maintain their relative proportions
**Equal Spacing** | ![](images/size/fill_equalSpacing.png) | ![](images/size/leading_equalSpacing.png) | ![](images/size/center_equalSpacing.png) | ![](images/size/trailing_equalSpacing.png) | The intrinsic height of each inner view is respected. They are positioned so that they touch the top and bottom of the stack view, with equal spacing in between.
**Equal Centering** | ![](images/size/fill_equalCentering.png) | ![](images/size/leading_equalCentering.png) | ![](images/size/center_equalCentering.png) | ![](images/size/trailing_equalCentering.png) | The intrinsic height of each inner view is respected. They are positioned so that they touch the top and bottom of the stack view, but they are spaced so that the center Y of each view is equal distance apart.

### StackViews with No Size

Distribution ↓ / Alignment → | Fill | Leading | Center | Trailing
---|---|---|---|---
**Fill** | ![](images/no_size/fill_fill.png) | ![](images/no_size/leading_fill.png) | ![](images/no_size/center_fill.png) | ![](images/no_size/trailing_fill.png)
**Fill Equally** | ![](images/no_size/fill_fillEqually.png) | ![](images/no_size/leading_fillEqually.png) | ![](images/no_size/center_fillEqually.png) | ![](images/no_size/trailing_fillEqually.png)
**Fill Proportionally** | ![](images/no_size/fill_fillProportionally.png) | ![](images/no_size/leading_fillProportionally.png) | ![](images/no_size/center_fillProportionally.png) | ![](images/no_size/trailing_fillProportionally.png)
**Equal Spacing** | ![](images/no_size/fill_equalSpacing.png) | ![](images/no_size/leading_equalSpacing.png) | ![](images/no_size/center_equalSpacing.png) | ![](images/no_size/trailing_equalSpacing.png)
**Equal Centering** | ![](images/no_size/fill_equalCentering.png) | ![](images/no_size/leading_equalCentering.png) | ![](images/no_size/center_equalCentering.png) | ![](images/no_size/trailing_equalCentering.png)