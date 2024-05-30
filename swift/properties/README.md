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
When `let` is used to create an instance of a class, it means that the reference cannot be changed. You can modify the value it references, but you cannot reassign the reference:

```swift
constantPerson = Person("Amy", 39) // Error: Cannot assign to value: constantPerson is a let constant
```

<br/>

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
print(file.filename) // house.png
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

<br/>

### Setting Computed Properties
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
In the above example, the keyword `newValue` represents the value that has just been assigned. If you want, you can define your own name for the new value:

```swift
set(newEnd) {
    start = newEnd - length
}
```

> Note: Computed properties can only be declared with the `var` keyword because their values aren't fixed.

Computed properties can be used to control access to private variables within a class. In this example, the details of the file class are hidden and just the name is exposed:

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

> Important: Computed properties perform their operation *every* time they are called which means that heavy operations (ex: sorting) can easily result in a performance decrease. If your computed property is making its calculations using static data, consider making this calculation once during initialization and storing the result in a stored property instead.

<br/>

### Computed Properties within an Extension
Another useful thing about computed properties is that they can be used within extensions. In this example, we can create quick access to the width and height of a view:

```swift
extension UIView {
    var width: CGFloat {
        return frame.size.width
    }

    var height: CGFloat {
        return frame.size.height
    }
}
```

<br/>

### Overriding Computed Properties
Within subclasses, you can override read-only computed properties:

```swift
class University {
    var tuition: Int {
        return 1000
    }
}

class Carleton: University {
    override var tuition: Int {
        return 2000
    }
}
```
It is important to note that you cannot override stored properties. The following code would fail:

```swift
class University {
    var tuition: Int = 1000
}

class Carleton: University {
    override var tuition: Int = 2000 // Cannot override stored property 'tuition'
}
```

See Also: [Overriding Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/inheritance#overriding-properties)

<br/>

## Lazy Stored Properties
A *lazy stored property* is a property whose initial value isn't calculated until the first time it's used. It is indicated by using the `lazy` modifier before its declaration.

Lazy properties are useful when the initial value for a property is dependent on outside factors whose values aren’t known until after an instance’s initialization is complete. They are also useful when the initial value for a property requires complex or computationally expensive setup that shouldn’t be performed unless or until it’s needed. In the following example, `youngest` is only calculated once it's referenced.

```swift
struct Person {
    let name: String
    let age: Int
}

struct Family {
    let members: [Person]

    lazy var youngest: Person? = {
        print("youngest initialized")
        return members.min(by: {$0.age < $1.age})
    }()

    init(members: [Person]) {
        self.members = members
        print("Family initialized")
    }
}

var family = Family(members: [Person(name: "Homer", age: 36),
                              Person(name: "Marge", age: 34),
                              Person(name: "Bart", age: 10),
                              Person(name: "Lisa", age: 8)]) // Prints: "Family initialized"

print(family.youngest)
// Prints: "Youngest initialized"
// Prints: "Person(name: "Lisa", age: 8)"
```
An advantage of using lazy stored properties is that if the property is never used, you can avoid unnecessary allocation and computation.

> Note: A lazy property must always be declared with `var` because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value before initialization completes, and therefore can't be declared as lazy.

<br/>

### Differences Between Lazy Stored and Computed Properties
Lazy stored variables are calculated the first time they are referenced whereas computed properties are calculated *every* time they are referenced. Lazy stored variables are therefore more performant than computed properties, but this performance gain comes with a cost: lazy stored variables are calculated using the state at the moment they are called.

Consider the example above with `members` being declared with `var` instead of `let`:

```swift
struct Family {
    var members: [Person]

    lazy var youngest: Person? = {
        print("Youngest initialized")
        return members.min(by: {$0.age < $1.age})
    }()

    init(members: [Person]) {
        self.members = members
        print("Family initialized")
    }
}

var family = Family(members: [Person(name: "Homer", age: 36),
                              Person(name: "Marge", age: 34),
                              Person(name: "Bart", age: 10),
                              Person(name: "Lisa", age: 8)]) // Prints: "Family initialized"

print(family.youngest)
// Prints: "Youngest initialized"
// Prints: "Person(name: "Lisa", age: 8)"

family.members.append(Person(name: "Maggie", age: 1))
print(family.youngest)
// Prints: "Person(name: "Lisa", age: 8)"
```
After adding "Maggie" with an age of 1, you would expect `youngest` to return "Maggie". However, as `youngest` has already been initialized before the mutation took place, the stored value is set to Lisa with age 8. In this scenario a computed property would be more appropriate.

<br/>

## Property Observers
Property observers allow you to observe and respond to changes in properties. There are two property observers:

* `willSet` - called right before a property is set
* `didSet` - called right after a property is set

```swift
struct Hero {
    var strength: Int {
        willSet(newStrength) {
            print("Strength is about to be changed from \(strength) to \(newStrength)")
        }
        didSet(oldStrength) {
            print("Strength was changed from \(oldStrength) to \(strength)")
        }
    }
}

var hero = Hero(strength: 10)
hero.strength = 20
// Prints: "Strength is about to be changed from 10 to 20"
// Prints: "Strength was changed from 10 to 20"
```
In the above example we are assigning the names `newStrength` and `oldStrength` to the new and old values, but these can be omitted:

```swift
var strength: Int {
    willSet {
        print("Strength is about to be changed from \(strength) to \(newValue)")
    }
    didSet {
        print("Strength was changed from \(oldValue) to \(strength)")
    }
}
```
Notice how, the property observers aren't called when the property is first initialized. This is because a property has to already contain a value before its property observers will be called. This means that property observers can't be used with lazy properties.

Keep in mind that if you pass a property that has observers to a function as an in-out parameter, the `willSet` and `didSet` observers will be called. This is because of the copy-in copy-out memory model for in-out parameters. The value is always written back to the property at the end of the function.

```swift
func doSomething(strength: inout Int) {
    print("Doing something")
}

doSomething(strength: &hero.strength)
// Prints: "Doing something"
// Prints: "Strength is about to be changed from 20 to 20"
// Prints: "Strength was changed from 20 to 20"
```

<br/>

## Property Wrappers


A property wrapper is a type that wraps a given value in order to attach additional functionality or behaviour to it. They are very useful in reducing repetitive code; Instead of writing getter and setter methods for common property functionalities (like data validation or persistence), you can define the logic in a reusable property wrapper.

The advantages of property wrappers can be best explained with the following example. Suppose we had the following struct that represents a person with a first and last name:

```swift
struct Person {
    var firstName: String
    var lastName: String
}
```

If we wanted to ensure that the first and last names were always capitalized, we could use the `didSet` property observer and a custom initializer:

```swift
struct Person {
    var firstName: String {
        didSet {
            firstName = firstName.capitalized
        }
    }
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }

    init(firstName: String, lastName: String) {
        self.firstName = firstName.capitalized
        self.lastName = lastName.capitalized
    }
}

var person = Person(firstName: "fred", lastName: "flinstone") // Fred Flinstone
person.lastName = "weasley" // Fred Weasley
person.firstName = "george" // George Weasley
```

However, this introduces some repetition which could explode if we require more properties to be capitalized in the future. We can remove this repetition by encapsulating this capitalization logic within a property wrapper like so:

```swift
@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.capitalized
        }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}
```

Now, our struct simply needs to prefix the `firstName` and `lastName` properties with the `@Capitalized` property wrapper and they will maintain the capitalization behaviour.

```swift
struct Person {
    @Capitalized var firstName: String
    @Capitalized var lastName: String

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

var person = Person(firstName: "taylor", lastName: "swift") // Taylor Swift
person.firstName = "austin" // Austin Swift
```

<br/>

## Links
* [Swift Documentation](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
* [SwiftLee - Computed Properties](https://www.avanderlee.com/swift/computed-property/)
* [SwiftLee - Lazy Stored Properties](https://www.avanderlee.com/swift/lazy-var-property/)
* [Property Wrappers in Swift](https://www.swiftbysundell.com/articles/property-wrappers-in-swift/)

