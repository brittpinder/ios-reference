# AutoLayout

## Anchors



Different options (relationships) for setting constraints (equalToSystemSpacingBelow, equalTo, constant, mutliplier etc.)

## UILayoutGuides

* SafeAreas - areas where controls won't be blocked or hidden from status bars, navigation bars, tab bars, tool bars etc.
* LayoutMargins - Rectangular layout guide used to provide default margins for spacing as well as custom layout areas for extra space
* ReadableContent - A dynamically calculated area that tries to preserve content for reading based on orientation and font size. Looks similar to LayoutMargins but the big difference happens when you add text and go into landscape mode. Most noticeable on iPad
* You can make your own using UILayoutGuide()
* Use instead of placeholder views as they are less expensive

## Intrinsic Content Size

* Every component has one
* The natural size that a control wants to be
* Allows controls to lay themselves out without requiring full constraints
* Some controls such as labels and buttons can calculate their intrinsic content size based on their content
* UIView has no intrinsic content size
* Can set programmatically:

```swift
override var intrinsicContentSize: CGSize {
	return CGSize(width: 50, height: 20)
}
```

Content Hugging and Compression Resistance (CHCR)

* Optional constraints that apply to intrinsic content size
* What gives our components the ability to flex
* Content Hugging controls how a control should grow. ex: width <= 50
* Compression Resistance controls how a control should shrink. ex: width >= 50
* Priorities are set on these constraints to control how much the component should shrink/grow
* `UILayoutPriority`
	* `.required = 1000`
	* `.defaultHigh = 750`
	* `.defaultLow = 250`
	* Anchor priorities are set to `.required`
	* Intrinsic Size is optional (`.defaultHigh` or `.defaultLow`)
	* Therefore Anchors will always override the intrinsic content size
	* By changing the priorities we can resolve ambiguity
* `view.setContentHuggingPriority(.defaultHigh, for: .horizontal)`
* By default iOS controls are set to stretch:
	* Content Hugging is set to `.defaultLow` (allowing it to stretch)
	* Compression Resistance is set to `.defaultHigh` (dislikes being compressed)
* Working with ImageViews

## StackView

* Allow for fewer constraints
* `stackView.addArrangedSubView()`
* Distribution
	* Fill
		* Fills all available space
		* Default setting
		* Uses intrinsic content size (CHCR)
		* If CHCR the same it will complain
	* Fill Equally
		* Makes all controls the same size
		* Only distribution that does not use intrinsic content size
		* It will break the optional intrinsic content size of your components in order to fill equally
	* Fill Proportionally
		* Maintains proportions as layout grows and shrinks
	* Equal Spacing
		* Maintains equal space between each control
	* Equal Centering
		* Spaces equally between center of controls
* Alignment
	* Top (horizontal stackview)
	* Bottom (horizontal stackview)
	* Leading (vertical stackview)
	* Trailing (vertical stackview)
	* Center
	* Fill
* A stackview is a container. It has no intrinsic content size of its own. It derives its size from its contents
* Everything inside needs to be intrinsically content sized
* How you pin a stackview affects the internal custom views' behaviour
* Adding padding to a stackview:
	* `stackView.isLayoutMarginsRelativeArrangement = true`
	* `stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 40, leading: 16, bottom: 40, trailing: -16)`
* Spacer Views trick

When making custom views...

* Give them an intrinsic content size
* Lay them out flush so they go right to the edges of yoru UIView container

## Links

* [AutoLayout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/)
* [Anatomy of a Constraint](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/AnatomyofaConstraint.html#//apple_ref/doc/uid/TP40010853-CH9-SW1)
* [LayoutGuides](https://developer.apple.com/documentation/uikit/uilayoutguide)
* [Views with Intrinsic Content Size](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ViewswithIntrinsicContentSize.html)
* [CHCR](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/AnatomyofaConstraint.html#//apple_ref/doc/uid/TP40010853-CH9-SW21)
* [IntrinsicContentSize](https://developer.apple.com/documentation/uikit/uiview/1622600-intrinsiccontentsize)
* [InvalidateIntrinsicContentSize](https://developer.apple.com/documentation/uikit/uiview/1622457-invalidateintrinsiccontentsize)
* [UILayoutPriority](https://developer.apple.com/documentation/uikit/uilayoutpriority)
* [UIStackView](https://developer.apple.com/documentation/uikit/uistackview)
* [UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)
* [AutoLayout Cookbook](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/LayoutUsingStackViews.html#//apple_ref/doc/uid/TP40010853-CH11-SW1)
* [StackView Distribution](https://developer.apple.com/documentation/uikit/uistackview/distribution)
* [StackView Alignment](https://developer.apple.com/documentation/uikit/uistackview/alignment)
* [NSHipster](https://nshipster.com/uistackview/)

