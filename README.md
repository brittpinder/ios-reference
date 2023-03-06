# ios-reference

## Swift
* [Optionals](https://github.com/brittpinder/ios-reference/tree/main/swift/optionals)
* [Functions](https://github.com/brittpinder/ios-reference/tree/main/swift/functions)
* [Closures - wip](https://github.com/brittpinder/ios-reference/tree/main/swift/closures)
* [Enums](https://github.com/brittpinder/ios-reference/tree/main/swift/enums)
* [Structures and Classes](https://github.com/brittpinder/ios-reference/tree/main/swift/structs-vs-classes)
* [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties)
* [Inheritance](https://github.com/brittpinder/ios-reference/tree/main/swift/inheritance)
* [Initialization](https://github.com/brittpinder/ios-reference/tree/main/swift/initialization)
* [Error Handling and Assertions](https://github.com/brittpinder/ios-reference/tree/main/swift/error-handling)
* [Access Control](https://github.com/brittpinder/ios-reference/tree/main/swift/access-control)
* [Keywords](https://github.com/brittpinder/ios-reference/tree/main/swift/keywords)


## UIKit
* [Creating a Project Without Storyboards](https://github.com/brittpinder/ios-reference/tree/main/uikit/no-storyboards)
* [Auto Layout](https://github.com/brittpinder/ios-reference/tree/main/uikit/autolayout)
* [UIViewController - wip](https://github.com/brittpinder/ios-reference/tree/main/uikit/uiviewcontroller)
* [UIStackView](https://github.com/brittpinder/ios-reference/tree/main/uikit/uistackview)
* [UITableView - wip](https://github.com/brittpinder/ios-reference/tree/main/uikit/uitableview)


# To Learn

## Priority

1. Generics
1. **Containers**
	1. 	Arrays
	1. 	Sets
	1. 	Tuples
	1. 	Dictionaries
1. **Memory Safety and Management**
	1. References vs Values
	1. [**In-out parameters**](https://docs.swift.org/swift-book/ReferenceManual/Declarations.html)
	1. 	Is it possible to pass parameter as const reference?
	1. Automatic Reference Counting
	1. 	**`weak var`, `strong` and retain cycles, unowned self**
	2. [Retain Cycle, Automatic Reference Counting, Memory Leak Video](https://www.youtube.com/watch?v=VcoZJ88d-vM&list=PL8seg1JPkqgF5wazzCKSq3EEfqt3t8mvA&index=16&ab_channel=SeanAllen)
	3. Memory leaks in closures (weak self, unknown self)
1. Switch case with Value Bindings and `where`
1. **Notification Center** (Observer Pattern)
1. **SceneDelegate**
1. **App Lifecycle**
1. UIView
	1. Lifecycle
	1. [View frames vs bounds](https://medium.com/@jon.lazar/my-approach-to-learning-ios-fccf943aead)
	2. 1. https://www.youtube.com/watch?v=Nfzy1qgxSAg&ab_channel=SeanAllen
1. **Labels and fonts - best practices**
1. **adaptive layouts (changing orientation)**
	1. 	`UITraitCollection`
	2. [Handle View Rotations](https://developer.apple.com/documentation/uikit/uiviewcontroller#1652814)
1. Points vs Pixels
1. **UINavigationController**
	1. 	Stack: Push/Pop vs Modal: Present/Dismiss 
1. **UITabBarController**
1. **Touch events - how they work**
	1. Gesture Recognizers
1. **Networking**
	1. 	**Dispatch Methods**
	1. 	JSON Encoder
1. [**Race Conditions & Multithreading**](https://www.youtube.com/watch?v=iTcq6L-PaDQ&ab_channel=SeanAllen)
	1. [Main vs Background Thread](https://medium.com/@jon.lazar/my-approach-to-learning-ios-fccf943aead
	1. 	**`@escaping`**
	1. `nonatomic` vs `atomic`
1. **Persistence**
	1. 	UserDefaults
	1. 	CoreData
	1. 	Realm
1. **Core Animation**
1. Communication Patterns between views
	1. Delegates vs Observers and Notifications
1. Testing
1. Bundles
2. `@autoclosure`
3. Provisioning Profiles
4. `Any` and `AnyObject`
5. Protocols
6. Extensions
		
## [Foundation](https://developer.apple.com/documentation/foundation)

* [Advanced Closure Topics](https://github.com/brittpinder/ios-reference/tree/main/swift/closures#advanced-closure-topics)
	* [Setting a Default Property Value with a Closure or Function](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/#Setting-a-Default-Property-Value-with-a-Closure-or-Function)
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
	* `dynamic`
	* `@available(iOS 16.0, *)`
	* `@MainActor`
* [Patterns](https://docs.swift.org/swift-book/ReferenceManual/Patterns.html#)
	* Protocol Delegate Pattern
	* DataSource Pattern
* Dates
	* DateFormatter
	* DateComponents
* NSAttributedString and NSMutableAttributedString
* [Cleanup Actions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/#Specifying-Cleanup-Actions)


## UIKit

* View Controllers
	* [Methods for showing and hiding](https://developer.apple.com/documentation/uikit/view_controllers/showing_and_hiding_view_controllers)
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

## Other Topics

* Third Party Libraries: CocoaPods & Swift Package Manager
* Push Notifications
* Code Signing
* Provisioning Profiles
* pList
* Core Graphics

## Links
* [When to use guard in Swift](https://www.advancedswift.com/when-to-use-guard-in-swift/)

## Interview Questions
* https://www.youtube.com/watch?v=56ZO6Gg68tw&list=PL8seg1JPkqgF5wazzCKSq3EEfqt3t8mvA&index=17&ab_channel=SeanAllen
* https://github.com/9magnets/iOS-Developer-and-Designer-Interview-Questions
* https://medium.com/@jon.lazar/my-approach-to-learning-ios-fccf943aead
* https://www.hackingwithswift.com/store/swift-coding-challenges
* https://www.youtube.com/watch?v=8XqzE-7e1qk&ab_channel=SeanAllen
* https://iosinterviewguide.com/ios-interview-questions-for-senior-developers-in-2020


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