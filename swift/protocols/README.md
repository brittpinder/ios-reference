# Protocols

Much like interfaces (abstract classes) in C++, protocols define a blueprint of methods, properties and other requirements to be adopted by a class, structure or enumeration. When a type *adopts* a protocol, it must *conform* to that protocol by providing an actual implementation of the protocol's requirements.

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

