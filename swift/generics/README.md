# [Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)

Generics in Swift are like templates in C++. They enable you to write flexible, reusable code that can be used with any type, subject to requirements that you define. For example, the following function allows you to swap two values of any type, as long as they have the same type:

```swift
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
```

It can be used to swap two `Int` values:

```swift
var num1 = 34
var num2 = 16

swapValues(&num1, &num2)

print(num1) // 16
print(num2) // 34
```

Or it can be used to swap two `String` values:

```swift
var name1 = "Bob"
var name2 = "Fred"

swapValues(&name1, &name2)

print(name1) // Fred
print(name2) // Bob
```

<br/>

## Type Parameters

Type parameters specify and name a placeholder type, and are written immediately after the function's name, between a pair of angle brackets. In the example above, the placeholder type `T` is an example of a type parameter.

Once you specify a type parameter, you can use it to define the type of a function's parameters, the function's return type or type annotations within the body of the function. In each case, the type parameter is replaced with an *actual* type whenever the function is called.

You can provide more than one type parameter by writing multiple type parameter names within the angle brackets, separated by commas: `<Type1, Type2, Type3>`

In most cases, type parameters have descriptive names, such as `Key` and `Value` in `Dictionary<Key, Value>` and `Element` in `Array<Element>`. When there isn't an obvious name, it's common practice to name them using single letters such as `T`, `U` and `V`.

<br/>

## Generic Types

As well as generic functions, you can define your own generic types. The following is a generic collection type for a stack:

```swift
struct Stack<Element> {
    var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var numbers = Stack<Int>()
numbers.push(5)
numbers.push(8)
numbers.push(3)
numbers.pop()

print(numbers) // Stack<Int>(items: [5, 8])
```

<br/>

## Type Constraints

It is possible to restrict which types can be used by a generic function or type by using *type constraints*. Type constraints specify that a type parameter must inherit from a specific class, or conform to a particular protocol or protocol composition. For example, Swift's `Dictionary` has a constraint which requires the type of the dictionary's `Key` to conform to the [`Hashable`](https://developer.apple.com/documentation/swift/hashable) protocol.

Type constraints are specified by placing a single class or protocol constraint after a type parameter’s name, separated by a colon, as part of the type parameter list:

```swift
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here
}
```

For example, the following function for finding the index of a value within an array requires the use of the "equal to" operator (`==`), so only types that support this operation can be used. This is enforced by requiring the type `T` to conform to the [`Equatable`](https://developer.apple.com/documentation/swift/equatable) protocol. In fact, without this type constraint, the function would not compile.

```swift
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let scores = [45, 88, 76, 92, 100]
let index = findIndex(of: 92, in: scores)
print(index) // Optional(3)

let names = ["Pam", "Jim", "Dwight", "Angela"]
let nameIndex = findIndex(of: "Jim", in: names)
print(nameIndex) // Optional(1)
```

<br/>

## Associated Types

Associated types allow you to apply generic behaviour to protocols. An associated type, declared using `associatedtype`, gives a placeholder name to a type that's used as part of a protocol. The actual type to use for that associated type isn't specified until the protocol is adopted.

For example, the following protocol has an associated type called `Art`:

```swift
protocol Artist {
    associatedtype Art
    func create(art: Art) -> Art
}
```

Structs and classes that adopt this protocol will need to define the type that `Art` will represent. In this case, `Art` represents a `Song`:

```swift
struct Song {
    let name: String
    let key: String
    let length: Double
}

struct Musician: Artist {
    func create(art: Song) -> Song {
        return Song(name: "Prelude", key: "A flat major", length: 3.5)
    }
}
```

And in this example, `Art` represents a `Painting`:

```swift
struct Painting {
    let size: (width: Double, height: Double)
    let value: Double
}

struct Painter: Artist {
    func create(art: Painting) -> Painting {
        return Painting(size: (width: 8.5, height: 11), value: 150)
    }
}
```

<br/>

## Generic Where Clauses

Generic where clauses use the `where` keyword to define requirements for associated types. For example, suppose we had the following protocol for a store:

```swift
protocol Store {
    associatedtype Item
    var items: [Item] { get }
    mutating func addItem(_ item: Item)
}
```

And the following struct `Market` that adopts the `Store` protocol and assigns the associated type `Item` to `Food`:

```swift
struct Food {
    var name: String
    var calories: Int
}

struct Market: Store {
    var items = [Food]()

    mutating func addItem(_ item: Food) {
        items.append(item)
    }
}
```

We could then write the following function for getting the item with the highest calories from a store:

```swift
func getHighestCalorieItem<S: Store>(from store: S) -> Food? where S.Item == Food {
    return store.items.max(by: { $1.calories > $0.calories })
}
```

This function goes through the `items` array and finds the item with the highest calorie count, so it will only work with items that are of type `Food`. This is enforced using the where clause: `where S.Item == Food`.

This function can be used by an instance of `Market` because its associated type `Item` is equivalent to `Food`:

```swift
var market = Market()
market.addItem(Food(name: "Apple", calories: 52))
market.addItem(Food(name: "Banana", calories: 110))
market.addItem(Food(name: "Lemon", calories: 17))

print(getHighestCalorieItem(from: market)?.name) // Optional("Banana")
```

However it cannot be used by an instance of `Bookstore` since `Book` is not equal to `Food`:

```swift
struct Book {
    var name: String
    var pages: Int
}

struct Bookstore: Store {
    var items = [Book]()

    mutating func addItem(_ item: Book) {
        items.append(item)
    }
}

getHighestCalorieItem(from: Bookstore()) // Error: Global function 'getHighestCalorieItem(from:)' requires the types 'Book' and 'Food' be equivalent
```

<br/>

### Extensions with a Generic Where Clause

Generic where clauses can also be used as part of an extension. For example, the extension below adds a function to `Array` only when the elements of the array conform to the `Comparable` protocol:

```swift
extension Array where Element: Comparable {
    func allAreEqual() -> Bool {
        for i in 1..<count {
            if self[i] != self[0] {
                return false
            }
        }
        return true
    }
}

print([4, 6, 4, 3].allAreEqual()) // false
print(["hello", "hello", "hello"].allAreEqual()) // true
print([2.1, 2.2].allAreEqual()) // false
```
As you can see, this function will cause a compiler error when used on an array of elements that don't conform to `Comparable`:

```swift
let foods = [Food(name: "Apple", calories: 52), Food(name: "Apple", calories: 52)]
print(foods.allAreEqual()) // Error: Referencing instance method 'allAreEqual()' on 'Array' requires that 'Food' conform to 'Comparable'
```

<br/>

Generic where clauses can be used in many more ways as can be seen in the examples in [Apple's documentation](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/#Generic-Where-Clauses).

<br/>

## Links

* [Where usage in Swift](https://www.avanderlee.com/swift/where-using-swift/)