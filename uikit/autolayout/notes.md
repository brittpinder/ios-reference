# AutoLayout


## UILayoutGuides

* SafeAreas - areas where controls won't be blocked or hidden from status bars, navigation bars, tab bars, tool bars etc.
* LayoutMargins - Rectangular layout guide used to provide default margins for spacing as well as custom layout areas for extra space
* ReadableContent - A dynamically calculated area that tries to preserve content for reading based on orientation and font size. Looks similar to LayoutMargins but the big difference happens when you add text and go into landscape mode. Most noticeable on iPad
* You can make your own using UILayoutGuide()
* Use instead of placeholder views as they are less expensive


## StackView

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
* [UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)
* [NSHipster](https://nshipster.com/uistackview/)

