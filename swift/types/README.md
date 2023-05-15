# [Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/types/)


## Any, AnyObject and NSObject

`Any`, `AnyObject` and `NSObject` are all data types.

<br/>

![](images/0.jpg)

<br/>

### [Any](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/types/#Any-Type)

`Any` represents an instance of **any** type at all (functions, classes, structs, ints, bools etc).

Using `Any`, you can create collections that contain may different types:

```swift
struct Dog {
    let name: String
}

class Cat {
    let name: String

    init(name: String) {
        self.name = name
    }
}

let age = 25
let result = true
let printHello = { print("Hello") }
let dog = Dog(name: "Jango")
let cat = Cat(name: "Sprinkles")
let button = UIButton()

let things: [Any] = [age, result, printHello, dog, cat, button]
```

<br/>

### [AnyObject](https://developer.apple.com/documentation/swift/anyobject)

`AnyObject` is a protocol to which all classes implicitly conform and therefore represents a class type. If the type of the array from the example above were changed to `AnyObject` we would have to remove everything except the class types:

```swift
let objects: [AnyObject] = [cat, button]
```

A common use of `AnyObject` is to restrict protocol adoption to class-types only:

```swift
protocol MyProtocol: AnyObject {}

class MyClass: MyProtocol {}

struct MyStruct: MyProtocol {} // Error: Non-class type 'MyStruct' cannot conform to class protocol 'MyProtocol'
```

<br/>

### [NSObject](https://developer.apple.com/documentation/objectivec/1418956-nsobject)

`NSObject` is a universal base class for all Foundation classes:

```swift
let nsObjects: [NSObject] = [button, NSNumber(value: 42), NSString(string: "hello world")]
```

<br/>

## Links

* [AnyObject, Any and any: When to use which](https://www.avanderlee.com/swift/anyobject-any/)