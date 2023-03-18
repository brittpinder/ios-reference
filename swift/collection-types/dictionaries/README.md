# [Dictionaries](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes/#Dictionaries)

A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary.

<br/>

## Creating Dictionaries

An empty dictionary can be initialized using either full or shorthand syntax, although shorthand is more common. The below examples all initialize an empty dictionary with keys of type `String` and values of type `Int`:

```swift
// Full syntax
var empty1: Dictionary<String, Int> = Dictionary<String, Int>()

// Full syntax with implicitly derived type
var empty2 = Dictionary<String, Int>()

// Shorthand syntax
var empty3: [String: Int] = [:]

// Shorthand syntax with implicitly derived type
var empty4 = [String: Int]()
```
> Note: A dictionary `Key` type must conform to the `Hashable` protocol, just like a set's value type

Dictionaries can be created and populated with values by using a *dictionary literal*:

```swift
// Array literal with explicit type
var numbers: [Int: String] = [4: "Four", 7: "Seven", 9: "Nine"]

// Array literal with implicitly derived type
var numbers1 = [4: "Four", 7: "Seven", 9: "Nine"]
```

<br/>

## Accessing Dictionaries

Like arrays and sets, you can use the `count` property to check how many key-value pairs are in a dictionary and the `isEmpty` property to check if a dictionary is empty:

```swift
var airports = ["YYZ": "Toronto Pearson", "ARN": "Stockholm-Arlanda"]
print(airports.count) // 2
print(airports.isEmpty) // false
```
Use subscript syntax to retrieve values for a particular key. Because it's possible to request a key for which no value exists, using a dictionary's subscript will return an optional value:

```swift
print(airports["YYZ"]) // Optional("Toronto Pearson")
print(airports["CDG"]) // nil

if let airportName = airports["YYZ"] {
    print(airportName)
}
// Toronto Pearson
```
<br/>

## Adding Key-Value Pairs to a Dictionary

To add a key-value pair to a dictionary, simply use subscript syntax like so:

```swift
airports["AKL"] = "Auckland"

print(airports) // ["ARN": "Stockholm-Arlanda", "YYZ": "Toronto Pearson", "AKL": "Auckland"]
```

<br/>

## Modifying Values in a Dictionary

You can also use subscript syntax to modify the value associated with a particular key:

```swift
airports["YYZ"] = "Toronto Pearson International"
```
Alternatively, you can use the `updateValue` method to change the value for a particular key. This function will return the old value before the modification was made:

```swift
let oldValue = airports.updateValue("Auckland Airport", forKey: "AKL")
print(oldValue) // Optional("Auckland")
print(airports["AKL"]) // Optional("Auckland Airport")
```

If you call `updateValue` for a key that doesn't exist in the dictionary, it will simply add that key-value pair to the dictionary:

```swift
let previousValue = airports.updateValue("Skopje", forKey: "SKP")
print(previousValue) // nil
print(airports["SKP"]) // Skopje
```

<br/>

## Removing Key-Value Pairs from a Dictionary

To remove a value from a dictionary, simply use subscript syntax to set the value for a particular key to nil:

```swift
airports["YYZ"] = nil
print(airports) // ["ARN": "Stockholm-Arlanda", "AKL": "Auckland Airport", "SKP": "Skopje"]
```
Alternatively, you can use the `removeValue` method which will return the removed value if it exists:

```swift
let removedValue = airports.removeValue(forKey: "ARN")
print(removedValue) // Optional("Stockholm-Arlanda")
print(airports) // ["SKP": "Skopje", "AKL": "Auckland Airport"]

let removed = airports.removeValue(forKey: "CDG")
print(removed) // nil
print(airports) // ["AKL": "Auckland Airport", "SKP": "Skopje"]
```

To remove all key-value pairs from a dictionary, you can either use the `removeAll` method which provides the option of maintaining the capacity of the dictionary, or you can simply assign the array to a set of square brackets with a colon inside `[:]`.

```swift
airports.removeAll(keepingCapacity: true)
print(airports) // [:]
print(airports.capacity) // 6

airports = [:]
print(airports) // [:]
print(airports.capacity) // 0
```

<br/>

## Links

* [Dictionary API Reference](https://developer.apple.com/documentation/swift/dictionary)