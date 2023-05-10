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

<br/>

## Methods

<br/>

## Subscripts

<br/>

## Nested Types

<br/>

## Extending Protocols
- Separating code using MARK comments

<br/>

## Links

* [Video Tutorial](https://www.youtube.com/watch?v=ALsr3hANqD0&ab_channel=PaulHudson)