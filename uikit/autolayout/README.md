# Auto Layout

Traditionally, apps would lay out their user interface programmatically by setting the frame for each view in the view hierarchy:

```swift
let view1 = UIView(frame: CGRect(x: 20, y: 100, width: 200, height: 100))
view1.translatesAutoresizingMaskIntoConstraints = true
view1.backgroundColor = .systemMint
view.addSubview(view1)

let view2 = UIView(frame: CGRect(x: 200, y: 400, width: 150, height: 250))
view2.translatesAutoresizingMaskIntoConstraints = true
view2.backgroundColor = .systemPink
view.addSubview(view2)
```

![](images/0.png)

Auto Layout is much more powerful because it allows your user interface to dynamically respond to both internal and external changes such as internationalization (changing language, text direction and text size based on locale), varying screen sizes and device rotations.


## Constraints

Auto Layout defines your user interface using a series of constraints. Constraints typically represent a relationship between two views. Auto Layout then calculates the size and location of each view based on these constraints: 

![](images/1.png)

Every view has a list of attributes ([`NSLayoutConstraint.Attribute`](https://developer.apple.com/documentation/uikit/nslayoutconstraint/attribute)) that can be constrained. There are two main types of attributes:

##### Size Attributes

* Width
* Height

##### Location Attributes

* Top
* Bottom
* Leading/Left
* Trailing/Right
* CenterX
* CenterY
* FirstBaseline (for alinging views to text)
* LastBaseline (for alinging views to text)

![](images/2.png)

### Layout Anchors

There are three choices when it comes to [programmatically creating constraints](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ProgrammaticallyCreatingConstraints.html) but the most common way is to use layout anchors ([`NSLayoutAnchor`](https://developer.apple.com/documentation/appkit/nslayoutanchor))

In this example, a rectangle is centered in the middle of the view by setting its center X and Y anchors equal to its superview's center X and Y anchors respectively. Its size is set by constraining its width and height anchors.

```swift
let rectangle = UIView()
rectangle.backgroundColor = .systemMint
rectangle.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(rectangle)

rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
rectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
rectangle.widthAnchor.constraint(equalToConstant: 200).isActive = true
rectangle.heightAnchor.constraint(equalToConstant: 100).isActive = true
```
![](images/4.png)

>Important: If you want to dynamically calculate the size and position of a view using Auto Layout, you *must* set `translatesAutoresizingMaskIntoConstraints` to false. If this flag is not set to false, your view will not appear on the screen.

The following shows how you can pin views to the top, bottom, leading and trailing edges of a view:

```swift
blue.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
blue.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

red.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
red.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

yellow.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
yellow.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

green.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
green.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
```
![](images/5.png)

> Constraints can be activated one at a time as shown above but you can also activate an array of constraints:
>
> ```swift
>NSLayoutConstraint.activate([
>    blue.topAnchor.constraint(equalTo: view.topAnchor),
>    blue.leadingAnchor.constraint(equalTo: view.leadingAnchor),
>    red.topAnchor.constraint(equalTo: view.topAnchor),
>    red.trailingAnchor.constraint(equalTo: view.trailingAnchor),
>    yellow.bottomAnchor.constraint(equalTo: view.bottomAnchor),
>    yellow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
>    green.bottomAnchor.constraint(equalTo: view.bottomAnchor),
>    green.trailingAnchor.constraint(equalTo: view.trailingAnchor)
>])
>```

### Layout Guides

[Layout Guides](https://developer.apple.com/documentation/uikit/uilayoutguide) are rectangular regions defined in their owning view's coordinate system that can interact with Auto Layout. You can use predefined layout guides or you can create your own. The most commonly used one is the "Safe Area Layout Guide" which defines the region of the screen where views won't be blocked or hidden by navigation bars, tab bars, tool bars etc. Using `view.safeAreaLayoutGuide`, we can now update the previous example so that the squares are placed within the safe area of the screen:

```swift
blue.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
blue.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true

red.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
red.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

yellow.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
yellow.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true

green.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
green.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
```
![](images/6.png)

Other predefined layout guides include:

* `layoutMarginsGuide`
* `directionalLayoutMarginsGuide`
* `readableContentGuide`
* `keyboardLayoutGuide`

## How Constraints Work

Every constraint represents a linear equation (y = mx + b). We define the relationship (=, <=, >=), the multiplier (m) and the constant (b) and Auto Layout solves the equation, finding values for y and x (the view attributes that we want to constrain).

![](images/3.png)

> This constraint states that the red view’s leading edge must be 8.0 points after the blue view’s trailing edge.

When defining constraints, there are a variety of options available depending on the type of attribute you are applying the constraint to.

Constraint Signature | Top/Bottom/Leading/Trailing/CenterY/CenterX | Width/Height
---|---|---
`equalTo:` | :heavy_check_mark: | :heavy_check_mark:
`equalToConstant:` |  | :heavy_check_mark:
`equalTo: constant:` | :heavy_check_mark: | :heavy_check_mark:
`equalTo: multiplier:` |  | :heavy_check_mark:
`equalTo: multiplier: constant:` |  | :heavy_check_mark:
`equalToSystemSpacingBelow/After: multiplier:` | :heavy_check_mark: | 

## Intrinsic Content Size

Each view in your hierarchy requires a position and a size. Some views will have an intrinsic size (labels, textfields, images) so you don't need to define it explicitly. You will still need to provide a position though.

## Priorities

Each constraint represents a linear equation, so your view hierarchy is simply a series of linear equations. Your goal is to declare a series of equations that have one and only one possible solution. Ambiguous constraints have more than one possible solution and unsatisfiable constraints don't have a valid solution.



All constraints have a priority between 1 and 1000. Constraints with a priority of 1000 are required. All other constraints are optional.

When calculating solutions, Auto Layout attempts to satisfy all the constraints in priority order from highest to lowest. If it cannot satisfy an optional constraint, that constraint is skipped and it continues on to the next constraint.

Even if an optional constraint cannot be satisfied, it can still influence the layout. If there is any ambiguity in the layout after skipping the constraint, the system selects the solution that comes closest to the constraint. In this way, unsatisfied optional constraints act as a force pulling views towards them.

## Links
* [Auto Layout Documentation](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/)
* [Anatomy of a Constraint](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/AnatomyofaConstraint.html)