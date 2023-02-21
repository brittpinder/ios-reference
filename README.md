# ios-reference

## Swift
* [Enums](https://github.com/brittpinder/ios-reference/tree/main/swift/enums)
* [Structures and Classes](https://github.com/brittpinder/ios-reference/tree/main/swift/structs-vs-classes)
* [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties)

## UIKit
* [Creating a Project Without Storyboards](https://github.com/brittpinder/ios-reference/tree/main/uikit/no-storyboards)
* [Auto Layout](https://github.com/brittpinder/ios-reference/tree/main/uikit/autolayout)
* [UIStackView](https://github.com/brittpinder/ios-reference/tree/main/uikit/uistackview)
* [UITableView - wip](https://github.com/brittpinder/ios-reference/tree/main/uikit/uitableview)


# To Learn

## Priority
1. **Optionals**
	1. 	Implicitly unwrapped optionals
	1. **If let vs guard let**
1. **Inheritance**
	1. **`final`**
1. **Closures**
1. **Containers**
	1. 	Arrays
	1. 	Sets
	1. 	Tuples
	1. 	Dictionaries
1. **Memory Safety and Management**
	1. References vs Values
	1. [**In-out parameters**](https://docs.swift.org/swift-book/ReferenceManual/Declarations.html)
	1. 	Is it possible to pass parameter as const reference?
1. **Access Levels**
1. Keywords
	1. 	**`@escaping`** 
	1. 	**`weak var` and retain cycles, unowned self**
	1. 	**`try`, `try!`, `try?`**
1. **Notification Center** (Observer Pattern)
1. **SceneDelegate**
1. **App Lifecycle**
1. **View Controller Life Cycle**
1. **Labels and fonts - best practices**
1. **adaptive layouts (changing orientation)**
	1. 	`UITraitCollection`
1. Points vs Pixels
1. **UINavigationController**
	1. 	Stack: Push/Pop vs Modal: Present/Dismiss 
1. **UITabBarController**
1. **Touch events - how they work**
1. **Networking**
	1. 	**Dispatch Methods**
	1. 	JSON Encoder
1. **Race Conditions & Multithreading**
1. **Persistence**
	1. 	UserDefaults
	1. 	CoreData
	1. 	Realm
1. **Core Animation**
		
## Swift

* Generics
* Error Handling
* Protocols
* Extensions
* Type Casting
* Subscripts
* Ranges
* [Bool.toggle](https://www.hackingwithswift.com/example-code/language/how-to-toggle-a-boolean-value)
* Argument Labels
* Properties
	* Wrappers
	* Global vs Local
	* Type Properties
* Unknown keywords
	* `#selector`
	* `required`
	* `required init?`
	* `@discardableResult`
	* `open`
	* `dynamic`
	* `@available(iOS 16.0, *)`
	* `@MainActor`
* [Patterns](https://docs.swift.org/swift-book/ReferenceManual/Patterns.html#)
	* Protocol Delegate Pattern
	* DataSource Pattern
	
* fatalError, assertionFailure, throw (what are the differences?)

## Foundation
* Dates
	* DateFormatter
	* DateComponents
* NSAttributedString and NSMutableAttributedString


## UIKit

* Nibs and Bundles
* Segues: Through storyboard (drag and drop) and through code
* UICalendarView
* UIDatePicker
* Modal presentation that covers part of the screen (adaptiveSheetPresentationController)
* [**UIScrollView**](https://github.com/jrasmusson/ios-professional-course/tree/main/Bankey/5-Scrollable-ViewControllers)
	* [Scrollview video explanation](https://www.youtube.com/watch?v=TYM65qxEQNs&ab_channel=SwiftArcade)
* UICollectionView
* Autolayout
	* More detail about predefined layout guides and creating your own
	* [Interesting way of pinning to view](https://www.youtube.com/watch?v=2yVzeFIMtyc&ab_channel=iOSAcademy)
	* willLayoutSubviews()
	* sizeToFit()
	* sizeThatFits()
* [Container View Controllers](https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html#//apple_ref/doc/uid/TP40007457-CH11-SW1)
	* UIPageViewController
	* SplitView (iPad only)
* GestureRecognizer

## Advanced Topics

* CocoaPods & Swift Package Manager
* Push Notifications
* Code Signing
* Provisioning Profiles
* pList
* Core Graphics


## New Feature Checklist
* Meets requirements
* Unit tests
* Error handling
* Performance
* Refactored
* TODOs
* Localization
* Label text length (no overflow)
* Simulate slow network connections with Network link conditioner
* Tested on a real device
* Tested on different device sizes

## Design
* [Create your own SF symbols](https://www.david-smith.org/blog/2023/01/23/design-notes-18/?utm_campaign=iOS%2BDev%2BWeekly&utm_medium=email&utm_source=iOS%2BDev%2BWeekly%2BIssue%2B595)