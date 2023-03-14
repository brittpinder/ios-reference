# Structures and Classes

Structures and classes have similar definition syntax:

```swift
struct SomeStructure {
    // structure definition goes here
}

class SomeClass {
    // class definition goes here
}
```
>Note: To adhere to Swift naming conventions, always define your struct and class names with `UpperCamelCase`. Give the properties and methods of structs and classes `lowerCamelCase` names.

<br/>

## Initialization

Structures have default initializers so you don't need to explicitly declare an `init()` method:

```swift
struct Dog {
    var name: String
    var age: Int
    
    func bark() {
        print("Woof")
    }
}

var dog = Dog(name: "Aayla", age: 5) // Using default init
```

However, you can still declare one if you want:

```swift
struct Dog {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func bark() {
        print("Woof")
    }
}

var dog = Dog(name: "Aayla", age: 5)
```
When defining a class, you **must** provide an `init()` method. If you don't, you will get a compiler error:

```swift
class Dog {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func bark() {
        print("Woof")
    }
}

var dog = Dog(name: "Aayla", age: 5)
```
> There is an exception to this rule: If all of a class's stored properties have default values, Swift will create a default initializer. Refer to [Initialization](https://github.com/brittpinder/ios-reference/tree/main/swift/initialization#default-initializers) for more details.

<br/>

## Value vs. Reference Types
It is very important to remember that structs are *value* types whereas classes are *references* types.

A *value* type is a type whose value is *copied* when it's assigned to a variable or constant, or when it's passed to a function. In the following example, when the var `otherDog` is created and assigned to `dog`, a copy of `dog` is created and assigned to `otherDog`:

```swift
struct Dog {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var dog = Dog(name: "Aayla", age: 5)
var otherDog = dog
otherDog.name = "Jango"

print(dog.name) // "Aayla"
print(otherDog.name) // "Jango"
```
However, notice what happens when we change the structure to a class. *Reference types* are not copied when they’re assigned to a variable or constant, or when they’re passed to a function. Rather than a copy, a reference to the same existing instance is used. So in this example, `otherDog` is a reference to `dog` which means that any changes we make to `otherDog` are also made to `dog`:

```swift
class Dog {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var dog = Dog(name: "Aayla", age: 5)
var otherDog = dog
otherDog.name = "Jango"

print(dog.name) // "Jango"
print(otherDog.name) // "Jango"
```
You can compare two variables using the identity operators `===` and `!==` to see if they are referencing the same class instance:

```swift
print(dog === otherDog) // true
print(dog !== otherDog) // false
```

For a more in depth comparision of value and reference types, see [Memory Management](https://github.com/brittpinder/ios-reference/tree/main/swift/memory-management#values-and-references)

<br/>

## Mutability

The `self` of a struct is defined using `let` which means that structs are inherently *immutable*. This means that a struct can't have any functions that change its properties. In the below example, the function `addToy` will cause a compiler error:

```swift
struct Dog {
    var name: String
    var age: Int
    var toys: [String]

    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.toys = [String]()
    }

    func addToy(toy: String) {
        toys.append(toy) // Error: Cannot use mutating member on immutable value 'self'
    }
}
```
You can however, append to the `toys` array manually:

```swift
var dog = Dog(name: "Aayla", age: 5)
dog.toys.append("Simba")
```

If you want a struct function to be able to change its properties, you can mark it with the `mutating` keyword:

```swift
mutating func addToy(toy: String) { // This is ok
    toys.append(toy)
}
```
It is important to note that if your struct instance is defined with `let`, you *cannot* call mutating functions:

```swift
let otherDog = Dog(name: "Jango", age: 1)
otherDog.addToy(toy: "Rooster") // Error: Cannot use mutating member on immutable value `otherDog`
```

Classes are inherently mutable, so you do not need to use the `mutating` keyword on a class's functions:

```swift
class Dog {
    var name: String
    var age: Int
    var toys: [String]

    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.toys = [String]()
    }

    func addToy(toy: String) {
        toys.append(toy)
    }
}
```
Remember that classes are reference types, so you can call mutable functions even if a class instance is defined with `let`.

```swift
let otherDog = Dog(name: "Jango", age: 1)
otherDog.addToy(toy: "Rooster") // This is ok
```
Read more about using `var` and `let` with classes and structs in the [Properties Section](https://github.com/brittpinder/ios-reference/tree/main/swift/properties)

<br/>

## Comparing Structures and Classes

Structs in Swift are much more powerful than structs in other languages like C++. Here is an overview of capabilities of structs and classes:

Feature | Struct | Class
---|---|---
Define properties to store values | :heavy_check_mark: | :heavy_check_mark:
Define methods to provide functionality | :heavy_check_mark: | :heavy_check_mark:
Define subscripts to provide access to their values using subscript syntax | :heavy_check_mark: | :heavy_check_mark:
Define initializers to set up their initial state | :heavy_check_mark: | :heavy_check_mark:
Default initializer provided | :heavy_check_mark: | 
Be extended to expand their functionality beyond a default implementation | :heavy_check_mark: | :heavy_check_mark:
Conform to protocols to provide standard functionality of a certain kind| :heavy_check_mark: | :heavy_check_mark:
Inheritance |  | :heavy_check_mark:
Type casting enables you to check and interpret the type of an instance at runtime |  | :heavy_check_mark:
Deinitializers enable an instance to free up any resources it has assigned |  | :heavy_check_mark:
Reference counting allows more than one reference to an instance |  | :heavy_check_mark:
Mutable |  | :heavy_check_mark:
Create deep copies that are not references | :heavy_check_mark: |
Threadsafe | :heavy_check_mark: |
Compatible with Objective-C code |  | :heavy_check_mark:
Pass by value/reference | value | reference
Live on the stack/heap | stack | heap

<br/>

### Performance

In general, structures are more performant than classes for a few reasons:

* Structures are allocated on the stack whereas classes are allocated on the heap
* Classes have the additional overhead of automatic reference counting
* In multi-threaded applications, classes need to protect their integrity by using locking or other synchronization methods

> Note: there are some cases where structures can become less performant than classes - particularly when a struct contains properties that are classes. Suppose you had a struct that contained three properties that were class types. For every instance of that struct, ARC would have to keep track of three different references. If the struct were changed to a class, ARC would only have to keep track of one reference per instance. For a detailed example watch [this video](https://developer.apple.com/videos/play/wwdc2016/416/) from 13:50 until 18:00.

<br/>

## Choosing Between Structures and Classes

It can be difficult to know whether or not to use a Struct or a Class. Below are some recommendations:

* Use structures by default
* Use classes when you need Objective-C interoperability
* Use classes when you need to control the identity of the data you're modeling
* Use structures along with protocols to adopt behavior by sharing implementations. Prefer protocol inheritance first whether you are using structs or classes. If you need non-protocol inheritance, then use a class.

<br/>

## Helpful Links
* [Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)
* [Structs vs Classes Video](https://www.youtube.com/watch?v=LtlbB4-6k_U&ab_channel=SeanAllen)
* [WWDC Video on Performance](https://developer.apple.com/videos/play/wwdc2016/416/)


