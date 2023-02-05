# ios-reference

## Swift
* [Enums](https://github.com/brittpinder/ios-reference/tree/main/swift/enums)
* [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties)

## UIKit
* [Creating a Project Without Storyboards](https://github.com/brittpinder/ios-reference/tree/main/uikit/no-storyboards)


# To Learn

## Swift
* Optionals
	* Implicitly unwrapped optionals
* If let vs guard let
* Classes vs Structs
* References vs Values
* Generics
* Error Handling
* Protocols
* Extensions
* Type Casting
* Ranges
* Argument Labels
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
* Access Levels
* Memory Safety
* Unknown keywords
	* `#selector`
	* `required`
	* `required init?`
	* `@escaping`
	* `@discardableResult`
	* `weak var` and retain cycles
	* `open`
	* `dynamic`
	* `try`, `try!`, `try?`
	* `final`
	* `@available(iOS 16.0, *)`
	* `@MainActor`
* [Patterns](https://docs.swift.org/swift-book/ReferenceManual/Patterns.html#)
	* Protocol Delegate Pattern
	* DataSource Pattern
* fatalError, assertionFailure, throw (what are the differences?)

## Foundation
* Dates

## UIKit
* Instantiating views and components through code instead of storyboard
* Segues: Through storyboard (drag and drop) and through code
* UICalendarView
* UIDatePicker
* Modal presentation that covers part of the screen (adaptiveSheetPresentationController)
* [UIScrollView](https://github.com/jrasmusson/ios-professional-course/tree/main/Bankey/5-Scrollable-ViewControllers)
* UICollectionView
* UITableView
	* Swipeable actions
	* Sections
	* UITableViewDiffableDataSource
	* beginUpdates, endUpdates, reloadData()
* Autolayout
	* Constraints
	* Points vs Pixels
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