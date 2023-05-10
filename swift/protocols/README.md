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

Protocols allow instances of classes and structures to be passed around and referenced using the protocol's type:

```swift
func makeObjectFly(object: FlyingObject) {
    object.fly()
}

makeObjectFly(object: Eagle()) // The eagle soars through the air
makeObjectFly(object: Airplane()) // The airplane takes off
```

When adopting more than one protocol, the protocol names should be separated by commas:

```swift
struct SomeStructure: FirstProtocol, SecondProtocol {
    // structure definition goes here
}
```

If a class inherits from a superclass and adopts one or more protocols, list the superclass first:

```swift
class SomeClass: SomeSuperclass, FirstProtocol, SecondProtocol {
    // class definition goes here
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

## Method Requirements

## Mutating Method Requirements

## Initializer Requirements

## Protocols as Types

## Delegation

## Adding Protocol Conformance with an Extension

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

