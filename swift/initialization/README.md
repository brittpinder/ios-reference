# Initialization

*Initialization* is the process of preparing an instance of a class, structure or enumeration for use. This involves setting initial values for each stored property of that instance as well as any other setup that's required before the new instance is ready for use.

<br/>

## Setting Initial Values for Stored Properties

Classes and structures *must* set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created. This can be done either by assigning a default value as part of the property's definition or by setting an initial value within an initializer.

```swift
// Assigning a default value
class Farenheit {
    var temperature: Double = 32.0
}

// Setting initial value within initializer
class Farenheit {
    var temperature: Double

    init() {
        temperature = 32.0
    }
}
```
If a property always takes the same initial value, it is preferred to provide a default value rather than setting a value within an initializer.


> Note: When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers.

<br/>

## Customizing Initialization

<br/>

## Default Initializers

<br/>

## Initializer Delegation for Value Types

<br/>

## Class Inheritance and Initialization

<br/>

## Failable Initializers

<br/>

## Required Initializers

<br/>

## Setting a Default Property Value with a Closure or Function

<br/>

# Deinitialization

Deinitializers perform any custom cleanup just before an instance of that class is deallocated.