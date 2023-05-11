# [Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols)

Much like interfaces (abstract classes) in C++, protocols define a blueprint of methods, properties and other requirements to be adopted by a class, structure or enumeration. When a type *adopts* a protocol, it must *conform* to that protocol by providing an actual implementation of the protocol's requirements. In other words, protocols are like contracts; they let us define what sort of functionality we expect certain types to support.

<br/>

## Syntax

Protocols are defined using the `protocol` keyword. For example, we could define a protocol for a flying object like so:

```swift
protocol FlyingObject {
    func fly()
}
```

We could then have various types adopt the `FlyingObject` protocol using the following syntax:

```swift
struct Eagle: FlyingObject {
    func fly() {
        print("The eagle soars through the air")
    }
}

class Airplane: FlyingObject {
    func fly() {
        print("The airplane takes off")
    }
}
```
Protocols are types; they allow instances of classes and structures to be passed around and referenced using the protocol's name:

```swift
func makeObjectFly(object: FlyingObject) {
    object.fly()
}

let flyingThing: FlyingObject = Eagle()
makeObjectFly(object: flyingThing) // The eagle soars through the air
makeObjectFly(object: Airplane()) // The airplane takes off
```

<br/>

## Method Requirements

The example from above, `FlyingObject` demonstrates a protocol that has a method requirement; all types that adopt `FlyingObject` must have a function with the signature `fly() -> Void`. When defining method requirements within a protocol, variadic parameters can be used but default parameters cannot.

### Mutating Method Requirements

If you define a protocol method that's intended to mutate instances of any type that adopts the protocol, mark the method with the `mutating` keyword.

```swift
protocol Togglable {
    mutating func toggle()
}

enum LightSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = LightSwitch.off
lightSwitch.toggle()
print(lightSwitch) // on
```

<br/>

## Initializer Requirements

Protocols can require specific initializers to be implemented by conforming types:

```swift
protocol Positioned {
    init(x: Int, y: Int)
}

struct Sprite: Positioned {
    init(x: Int, y: Int) {
        // Implementation details
    }
}
```

When a class conforms to a protocol initializer requirement, the initializer can be either a designated or a convenience initializer, but it must be `required` so that all subclasses of the conforming class also conform to the protocol.

```swift
class Image: Positioned {
    required init(x: Int, y: Int) {
        // Implementation details
    }
}
```

<br/>

## Property Requirements

A protocol can require any conforming type to provide a property with a particular name and type. The protocol must also specify one of two access requirements for each property:

1. Must be gettable (indicated by appending `{ get }`)
	* The requirement can be satisfied by any kind of property as long as it's readable
	* The property can be settable as well
2. Must be settable (indicated by appending `{ get set }`)
	* The requirement cannot be satisfied by a constant stored property or a read-only computed property

```swift
protocol SomeProtocol {
    var mustBeGettable: Int { get }
    var mustBeSettable: Int { get set }
}
```

<br/>

### Gettable Property Requirements

Below we have a protocol which requires conforming types to specify a number of legs:

```swift
protocol Legged {
    var numberOfLegs: Int { get }
}
```

Types that adopt this protocol must contain a property of type `Int` with the name `numberOfLegs`. The property can be a constant, variable or computed-property, as long as it's readable:

```swift
struct Insect: Legged {
    let numberOfLegs = 6
}

struct Table: Legged {
    var numberOfLegs = 4
}

struct Frog: Legged {
    enum LifeStage {
        case egg, tadpole, adult
    }
    var lifeStage: LifeStage

    var numberOfLegs: Int {
        switch lifeStage {
        case .egg:
            return 0
        case .tadpole:
            return 2
        case .adult:
            return 4
        }
    }
}
```
The following protocol adoption does not conform because `numberOfLegs` is `private` and therefore not gettable:

```swift
struct Alien: Legged {
    private var numberOfLegs: Int // Error: Property 'numberOfLegs' must be declared internal
}
```

<br/>

### Settable Property Requirements

Below we have a protocol `Named` which has a property `name` which must be settable:

```swift
protocol Named {
    var name: String { get set }
}
```

Types that adopt this protocol must have a settable property called `name` of type `String`:

```swift
struct Dog: Named {
    var name: String
}
```

The following protocol adoptions do not conform because the property is not settable:

```swift
struct Cat: Named {
    let name: String // Error: Type 'Cat' does not conform to protocol 'Named'
}

struct City: Named {
    private(set) var name: String // Error: Setter for property 'name' must be declared internal
}

struct Human: Named { // Error: Type 'Human' does not conform to protocol 'Named'
    var firstName: String
    var lastName: String

    var name: String {
        return firstName + " " + lastName
    }
}
```

<br/>

## Delegation

Delegation is a design pattern commonly used in Swift that enables a class or structure to hand off (or delegate) some of its responsibilities to an instance of another type. This design pattern is implemented by defining a protocol that encapsulates the delegated responsibilities, having a type adopt this protocol and then storing a reference to an instance of this type (the delegate).

For example, suppose we had a struct representing a boss that does some type of work:

```swift
struct Boss {
    func work() {
        print("Boss is doing the work")
    }
}

var boss = Boss()
boss.work() // Boss is doing the work
```

We could have the Boss pass off the work to somebody else by using the delegate pattern. First we would create a protocol defining the responsibilities to be delegated:

```swift
protocol BossDelegate {
    func doWork()
}
```
Then we can assign an optional instance of this protocol (the delegate) to the Boss struct and have the delegate do the work if it exists:

```swift
struct Boss {
    var delegate: BossDelegate?

    func work() {
        if let delegate {
            delegate.doWork()
        } else {
            print("Boss is doing the work")
        }
    }
}
```
Finally, we can create a new type that adopts this protocol and assign it as the Boss's delegate:

```swift
struct Employee: BossDelegate {
    func doWork() {
        print("Employee is doing the work")
    }
}

let employee = Employee()
boss.delegate = employee
boss.work() // Employee is doing the work
```
The boss doesn't care who does the work as long as the work gets done:

```swift
let intern = Intern()
boss.delegate = intern
boss.work() // Intern is doing the work
```
The delegate pattern is commonly used in Swift to allow various UI components to communicate with each other. For example, `UITableView` has a delegate, `UITableViewDelegate`, which allows view controllers to respond to various events such as selecting or swiping a row. Similarly, `UITextField` has a delegate, `UITextFieldDelegate`, which allows view controllers to respond to various events such as text changes and selections.

<br/>

## Adding Protocol Conformance with an Extension

A type can adopt and conform to more than one protocol by simply listing them, separated by commas. Here we have a custom view controller that adopts the `UITableViewDelegate` and the `UITextFieldDelegate` protocols:

```swift
class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Implementation details
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Implementation details
        return true
    }

}
```
> Note: Whenever a class inherits from a subclass and adopts one or more protocols, always list the subclass first.

However, it is common convention to add each individual protocol using an extension instead:

```swift
class ViewController: UIViewController {

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Implementation details
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Implementation details
        return true
    }
}
```
This keeps the code more organized as the various responsibilities are grouped accordingly.

<br/>

### Declaring Protocol Adoption with an Extension

If a type already conforms to all of the requirements of a protocol, but hasn’t yet stated that it adopts that protocol, you can make it adopt the protocol with an empty extension:

```swift
struct Spider {
    let type: String
    let numberOfLegs = 8
}

extension Spider: Legged {}
```

<br/>

### Conditionally Conforming to a Protocol

You can make a generic type conditionally conform to a protocol by listing constraints when extending the type. The following extension makes `Array` instances conform to the `Legged` protocol whenever they store elements of a type `Legged`:

```swift
extension Array: Legged where Element == any Legged {
    var numberOfLegs: Int {
        return self.map { $0.numberOfLegs }.reduce(0,+)
    }
}

let leggyThings: [Legged] = [Table(), Spider(type: "Black Widow"), Frog(lifeStage: .tadpole)]
print(leggyThings.numberOfLegs) // 14
```

<br/>

## Adopting a Protocol Using a Synthesized Implementation

## Collections of Protocol Types

## Protocol Inheritance

## Class-Only Protocols

## Protocol Composition

## Checking for Protocol Conformance

## Optional Protocol Requirements

## Protocol Extensions

## Providing Default Implementations

## Adding Constraints to Protocol Extensions

