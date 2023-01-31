# Properties

## Stored Properties
A stored property is a constant (`let`) or variable (`var`) that's stored as part of an instance of a particular class or structure.

```swift
struct Person {
    let name: String
    var age: Int
}

var person = Person(name: "Audrey", age: 25)
person.name = "Barbara" // Error: name is a let constant
person.age = 33
```

If you create an instance of a structure using `let`, you can't modify the instance's properties, even if they were declared with `var`. This is because structures are *value* types.

```swift
let constantPerson = Person(name: "Jake", age: 12)
constantPerson.age = 70 // Error: constantPerson is a let constant
```
However, if you create an instance of a *class* using `let`, you can modify its variable properties. This is because classes are *reference* types.

```swift
class Person {
    let name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var person = Person(name: "Audrey", age: 25)
person.name = "Barbara" // Error: name is a let constant
person.age = 33

let constantPerson = Person(name: "Jake", age: 12)
constantPerson.age = 70 // This is ok
```
When `let` is used to create an instance of a class, it means that the reference cannot be changed. So you can modify the variable values but you cannot reassign the reference:

```swift
constantPerson = Person("Amy", 39) // Error: Cannot assign to value: constantPerson is a let constant
```

## Computed Properties
Computed properties are calculated on the fly whenever they are needed. Computed properties don't actually store a value, they instead provide a getter and an optional setter to retrieve and set other properties and values indirectly. Class, structures and even enumerations can have computed properties.

```swift
struct File {
    var name: String
    let fileExtension: String

    // A computed property that generates a filename
    var filename: String {
        return name + "." + fileExtension
    }
}

let file = File(name: "house", fileExtension: "png")
print(file.filename)
```
To make the computed property even simpler, you can remove the `return` keyword:

```swift
var filename: String {
    name + "." + fileExtension
}
```
In this example, `filename` doesn't have a setter so it is read-only.

```swift
file.filename = "chair.png" // Error: Cannot assign to property: 'filename' is a get-only property
```
To make this more explicit, you could add a `get` wrapper around the computation, but this is not common practice:

```swift
var filename: String {
    get {
        name + "." + fileExtension
    }
}
```

Here is an example of a computed property with a setter. Notice that whenever the `end` property is set, the `start` property gets updated accordingly.

```swift
struct UIntRange {
    var start: UInt
    var length: UInt
    var end: UInt {
        get {
            return start + length
        }
        set {
            start = newValue - length
        }
    }
}

var range = UIntRange(start: 2, length: 5)
print(range.end) // 7

range.end = 10
print(range.start) // 5
```
In the above example, the keyword `newValue` represents the value that has just been assigned. If you want to you can give this new value your own name:

```swift
set(newEnd) {
    start = newEnd - length
}
```

> Note: Computed properties can only be declared with the `var` keyword because their values aren't fixed.

Computed properties can be used to control access to private variables within a class.:

```swift
struct Content {
    private var file: File

    var name: String {
        get {
            file.name
        }
        set {
            file.name = newValue
        }
    }
}
```


## Helpful Links
* [Swift Documentation](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)

