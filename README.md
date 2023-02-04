# ios-reference

## Swift
* [Enums](https://github.com/brittpinder/ios-reference/tree/main/enums)
* [Properties](https://github.com/brittpinder/ios-reference/tree/main/properties)


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
* Table View
	* Swipeable actions
	* Sections
	* UITableViewDiffableDataSource
	* beginUpdates, endUpdates, reloadData()
* Autolayout
	* Constraints
	* Points vs Pixels
* UIPageViewController

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