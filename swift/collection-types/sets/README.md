# [Sets](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes/#Sets)

A set is an unordered collection of unique elements that have the same type. You can use a set instead of an array when the order of items isn't important or when you need to ensure that an item only appears once.

A type must be *hashable* in order to be stored in a set. All of Swift's primitive types (String, Int, Double and Bool) are hashable by default. Enumeration cases without associated values are also hashable by default. You can store your own custom types in a set by making them conform to the [`Hashable`](https://developer.apple.com/documentation/swift/hashable) protocol.

<br/>

## Creating Sets

Unlike arrays, sets do not have shorthand syntax. When creating an empty set, you need to specify the type either explicitly or implicitly using `Set<Element>`:

```swift
// Explicit Type
var numbers: Set<Int> = Set<Int>()
var numbers1: Set<Int> = []

// Implicitly derived type
var numbers2 = Set<Int>()
```
A set can also be created and initialized with values by using an *array literal*:

```swift
var numbers3: Set<Int> = [4, 6, 8, 2]
```
Because of type inference, the above can be written in a shorter form:

```swift
var numbers4: Set = [4, 6, 8, 2]
```
> When creating a set, the `Set` keyword must be used. If the `Set` keyword were removed from the above declaration, an array would be created instead.

<br/>

## Accessing Sets

Like arrays, sets have the `count` and `isEmpty` properties:

```swift
var fruits: Set = ["apple", "banana", "pear"]
print(fruits.count) // 3
print(fruits.isEmpty) // false
```
It is important to remember that sets are *unordered*, which means the order in which you add elements to a set is not guaranteed. If the order of elements is important, you should instead use an array.

```swift
print(fruits) // ["pear", "banana", "apple"]
```

<br/>

## Inserting Elements into a Set

Add elements to a set using the `insert` method:

```swift
fruits.insert("orange")
print(fruits) // ["pear", "banana", "orange", "apple"]
```

This function returns a tuple which you can use to check if the element was successfully added or not. If it was not added, it means that the element already existed in the set.

```swift
let result = fruits.insert("banana")
print(result.inserted) // false
print(fruits) // ["pear", "banana", "orange", "apple"]
```
<br/>

## Removing Elements from a Set

Remove an element from a set using the `remove` method:

```swift
fruits.remove("pear")
print(fruits) // ["apple", "banana", "orange"]
```
This method returns the removed element if it was found, otherwise it returns `nil`:

```swift
let removedElement = fruits.remove("pineapple")
print(removedElement) // nil
print(fruits) // ["apple", "banana", "orange"]
```
To empty a set of all its elements, you can either use the `removeAll` method which provides you the option of maintaining the capacity of the set, or you can simply assign the set to an empty set of square brackets `[]`.

```swift
fruits.removeAll(keepingCapacity: true)
print(fruits) // []
print(fruits.capacity) // 6

fruits = []
print(fruits.capacity) // 0
```
<br/>

## Links

* [Set API Reference](https://developer.apple.com/documentation/swift/set)
* [Article on Hashable](https://betterprogramming.pub/what-is-hashable-in-swift-6a51627f904)