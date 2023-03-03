# [Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization)

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

You can customize the initialization process by providing intialization parameters and/or defining multiple `init` methods with different signatures.

```swift
struct Celsius {
    var temperatureInCelsius: Double

    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }

    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }

    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let bodyTemperature = Celsius(37.0)
print(bodyTemperature.temperatureInCelsius) // 37.0

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWater.temperatureInCelsius) // 100.0

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temperatureInCelsius) // 0.0
```
<br/>

### Optional Property Types

If your class has a stored property of type `Optional`, it will automatically be initialized with a value of `nil`, so you don't need to explicitly set it during initialization.

```swift
class Dog {
    var name: String
    var toy: String?

    init(name: String) {
        self.name = name
        // No need to set toy because it is an optional
    }
}
```
<br/>

### Assigning Constant Properties During Initialization

You can assign a value to a constant property at any point during initialization, as long as it's set to a definite value by the time initialization finishes. Once a constant property is assigned a value, it can't be further modified.

```swift
class Person {
    let name: String

    init(name: String) {
        self.name = name
    }
}

var person = Person(name: "Bob")
person.name = "Robert" // Error: Cannot assign to property: 'name' is a let constant
```

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

# [Deinitialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/deinitialization)

Deinitializers perform any custom cleanup just before an instance of that class is deallocated.