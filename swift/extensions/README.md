# [Extensions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions)

Extensions add new functionality to an existing class, structure, enumeration or protocol. They are declared using the `extension` keyword:

```swift
extension SomeType {
    // new functionality to add to SomeType goes here
}
```

For example, suppose we had the struct `Dog`. We could add the function `bark()` to it by defining it within an extension:


```swift
struct Dog {
    var name: String
    var breed: String
}

extension Dog {
    func bark() {
        print("woof")
    }
}
```
Now, any instance of `Dog` has access to the function `bark()`:

```swift
let dog = Dog(name: "Jango", breed: "Husky")
dog.bark() // woof
```

<br/>

## Retroactive Modeling

As well as custom types, extensions can be applied to Apple's built-in types whose source code is hidden. This is known as *retroactive modeling*. For example, we can extend the type `Int` to provide the function `isEven()`:

```swift
extension Int {
    func isEven() -> Bool {
        self % 2 == 0
    }
}

print(2.isEven()) // true
print(3.isEven()) // false
```

Retroactive modeling with extensions allows us to define utility functions in a very elegant way. Rather than having a variety of global helper functions, extensions naturally group functions with the type they refer to. Not only do they keep the code more organized but they also provide easier code completion (any functionality defined within an extension will appear in the list of suggestions when you write `.` after your type).

For example, we can extend `UIStackView` to provide a utility function that can add multiple subviews at once:

```swift
extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
```

Now the following three lines of code

```swift
stackView.addArrangedSubview(view1)
stackView.addArrangedSubview(view2)
stackView.addArrangedSubview(view3)
```
can be simplified into one line like so:

```swift
stackView.addArrangedSubviews(view1, view2, view3)
```

<br/>

## Computed Properties

Extensions can add new computed properties to an existing type:

```swift
extension Int {
    var squared: Int {
        self * self
    }
}

print(4.squared) // 16
```

> Note: Stored properties cannot be added within an extension because this would change the size of the type everywhere that it's used, resulting in major ramifications. Imagine the problems that would be caused if the size of an `Int` were changed by adding a stored property. Therefore, only computed properties can be added to a type using an extension.

<br/>


## Initializers

Extensions can add new initializers to existing types, allowing you to provide additional initialization options. Suppose we had the following struct representing a book:

```swift
struct Book {
    let title: String
    let pages: Int
    let readingHours: Double
}
```
If we wanted to calculate `readingHours` instead of requiring it to be explicitly stated, we could add a custom initializer within an extension:

```swift
extension Book {
    init(title: String, pages: Int) {
        self.title = title
        self.pages = pages
        self.readingHours = Double(pages) / 30.0
    }
}

let hp = Book(title: "Harry Potter", pages: 223)
print(hp.readingHours) // 7.43
```

Because this initializer is defined within an extension, we still have access to the default memberwise initializer:

```swift
let lotr = Book(title: "Lord of the Rings", pages: 1216, readingHours: 48)
```

If we had put our custom initializer directly into the `Book` struct instead of within and extension, a memberwise initializer would not be created.

<br/>

### Initializer Extensions for Classes

When working with classes, it is important to note that only convenience initializers can be added to an extension. Designated initializers and deinitializers must always be provided by the original class implementation.

For example, suppose we had the following class representing a square:

```swift
struct Point {
    var x: Double
    var y: Double
}

class Square {
    let position: Point
    let center: Point
    let length: Double

    init(position: Point, length: Double) {
        self.position = position
        self.length = length
        self.center = Point(x: position.x + length / 2, y: position.y + length / 2)
    }
}
```

If we wanted to provide another initializer that would take the center and length and calculate the position, the following would produce an error:

```swift
extension Square {
    init(center: Point, length: Double) { // Error: Designated initializer cannot be declared in an extension
        self.center = center
        self.length = length
        self.position = Point(x: center.x - length / 2, y: center.y - length / 2)
    }
}
```

We would instead have to define a convenience initializer like so:

```swift
extension Square {
    convenience init(center: Point, length: Double) {
        self.init(position: Point(x: center.x - length / 2, y: center.y - length / 2), length: length)
    }
}
```

<br/>

## Methods

As demonstrated in previous examples, extensions can add methods to existing types. Below, the `trimmed()` method returns a new `String` with white spaces and new lines removed:

```swift
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

var phrase = "   Hello world   "
print(phrase.trimmed()) //Hello World
```
Instance methods added with an extension can also modify (or *mutate*) the instance itself. Structure and enumeration methods that modify `self` or its properties must mark the instance method `mutating`.

For example, another method could be added to the `String` extension that modifies the instance by trimming the white space and new lines in place:

```swift
extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}

phrase.trim()
print(phrase) //Hello World
```

<br/>

## Nested Types

Extensions can add new nested types to existing classes, structures and enumerations. The following example adds a nested enumeration `Kind` to `Int` as well as a computer property `kind`:

```swift
extension Int {
    enum Kind {
        case negative, zero, positive
    }

    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

print(42.kind) // positive
```

<br/>

## Extending Protocols
- Separating code using MARK comments

<br/>

## Links

* [Video Tutorial](https://www.youtube.com/watch?v=ALsr3hANqD0&ab_channel=PaulHudson)