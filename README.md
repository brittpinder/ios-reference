# ios-reference

## Swift
* [Enums](https://github.com/brittpinder/ios-reference/tree/main/swift/enums)
* [Structures and Classes](https://github.com/brittpinder/ios-reference/tree/main/swift/structs-vs-classes)
* [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties)

## UIKit
* [Creating a Project Without Storyboards](https://github.com/brittpinder/ios-reference/tree/main/uikit/no-storyboards)
* [Auto Layout - wip](https://github.com/brittpinder/ios-reference/tree/main/uikit/autolayout)
* [UITableView - wip](https://github.com/brittpinder/ios-reference/tree/main/uikit/uitableview)


# To Learn

## Swift
* Optionals
	* Implicitly unwrapped optionals
* If let vs guard let
* Inheritance
	* **`final`**
* References vs Values
* Generics
* Error Handling
* Protocols
* Extensions
* Type Casting
* Subscripts
* Ranges
* [Bool.toggle](https://www.hackingwithswift.com/example-code/language/how-to-toggle-a-boolean-value)
* Argument Labels
* **inout**
	* Is it possible to pass parameter as const reference?
* Closures
* Containers
	* Arrays
	* Sets
	* Tuples
	* Dictionaries
* Properties
	* Wrappers
	* Global vs Local
	* Type Properties
* [In-out parameters](https://docs.swift.org/swift-book/ReferenceManual/Declarations.html#ID545)
* **Access Levels**
* Memory Safety
* Unknown keywords
	* `#selector`
	* `required`
	* `required init?`
	* **`@escaping`**
	* `@discardableResult`
	* **`weak var` and retain cycles, unowned self**
	* `open`
	* `dynamic`
	* `try`, `try!`, `try?`
	* `@available(iOS 16.0, *)`
	* `@MainActor`
* [Patterns](https://docs.swift.org/swift-book/ReferenceManual/Patterns.html#)
	* Protocol Delegate Pattern
	* DataSource Pattern
	* **Notification Center** (Observer Pattern)
* fatalError, assertionFailure, throw (what are the differences?)

## Foundation
* Dates
* NSAttributedString and NSMutableAttributedString

## UIKit
* **Instantiating views and components through code instead of storyboard**
* Nibs and Bundles
* Segues: Through storyboard (drag and drop) and through code
* UICalendarView
* UIDatePicker
* **Labels and fonts**
* Modal presentation that covers part of the screen (adaptiveSheetPresentationController)
* [UIScrollView](https://github.com/jrasmusson/ios-professional-course/tree/main/Bankey/5-Scrollable-ViewControllers)
	* [Scrollview video explanation](https://www.youtube.com/watch?v=TYM65qxEQNs&ab_channel=SwiftArcade)
* UICollectionView
* **Autolayout**
	* Constraints * Priorities
	* Points vs Pixels
	* Content Hugging Compression Resistance
	* [Interesting way of pinning to view](https://www.youtube.com/watch?v=2yVzeFIMtyc&ab_channel=iOSAcademy)
	* willLayoutSubviews()
	* adaptive layouts
	* sizeToFit()
	* sizeThatFits()
	* intrinsicContentSize
* **StackViews**
	* Alignment and Distribution options
* [Container View Controllers](https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html#//apple_ref/doc/uid/TP40007457-CH11-SW1)
	* UINavigationController
		* Stack: Push/Pop vs Modal: Present/Dismiss 
	* UITabBarController
	* UIPageViewController
	* SplitView (iPad only)

## Advanced Topics
* Persistence
	* UserDefaults
	* CoreData
	* Realm
* CocoaPods
* Push Notifications
* Code Signing
* Provisioning Profiles
* pList
* Race Conditions
* Core Animation
* Core Graphics
* **Dispatch Methods**
* **Race Conditions**

## New Feature Checklist
* Meets requirements
* Unit tests
* Error handling
* Performance
* Refactored
* TODOs
* Localization
* Label text length (no overflow)
* Simulate slow neetwork connections with Network link conditioner
* Tested on a real device
* Tested on different device sizes

## Design
* [Create your own SF symbols](https://www.david-smith.org/blog/2023/01/23/design-notes-18/?utm_campaign=iOS%2BDev%2BWeekly&utm_medium=email&utm_source=iOS%2BDev%2BWeekly%2BIssue%2B595)