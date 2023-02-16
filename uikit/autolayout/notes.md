# AutoLayout


## UILayoutGuides

* SafeAreas - areas where controls won't be blocked or hidden from status bars, navigation bars, tab bars, tool bars etc.
* LayoutMargins - Rectangular layout guide used to provide default margins for spacing as well as custom layout areas for extra space
* ReadableContent - A dynamically calculated area that tries to preserve content for reading based on orientation and font size. Looks similar to LayoutMargins but the big difference happens when you add text and go into landscape mode. Most noticeable on iPad
* You can make your own using UILayoutGuide()
* Use instead of placeholder views as they are less expensive


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
	* Fill (default)
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

## Adaptive Layouts

3 Ways to Tweak Constraints

* Change the constraint values
* Enable/disable constraints
* Toggle visibility of views

## Orientation Changes

* `registerForOrientationChanges()` --> Old school way
* `UITraitCollection` --> New way

## Links

* [InvalidateIntrinsicContentSize](https://developer.apple.com/documentation/uikit/uiview/1622457-invalidateintrinsiccontentsize)
* [UIStackView](https://developer.apple.com/documentation/uikit/uistackview)
* [UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)
* [AutoLayout Cookbook](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/LayoutUsingStackViews.html#//apple_ref/doc/uid/TP40010853-CH11-SW1)
* [StackView Distribution](https://developer.apple.com/documentation/uikit/uistackview/distribution)
* [StackView Alignment](https://developer.apple.com/documentation/uikit/uistackview/alignment)
* [NSHipster](https://nshipster.com/uistackview/)

