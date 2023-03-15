# [Collection Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes)

There are three collection types in Swift:

1. **Arrays** - ordered collections of values
2. **Sets** - unordered collections of unique values
3. **Dictionaries** - unordered collection sof key-value associations

![](images/0.png)

<br/>

## [Arrays](https://developer.apple.com/documentation/swift/array)

### Creating Arrays

An empty array can be initialized using either full syntax or shorthand syntax, although shorthand is more common.

```swift
// Full syntax
var numbers1: Array<Int> = Array<Int>()

// Full syntax with implicitly derived type
var numbers2 = Array<Int>()

// Shorthand syntax
var numbers3: [Int] = []

// Shorthand syntax with implicitly derived type
var numbers4 = [Int]()
```

An array can be created and populated with values by using an *array literal*:

```swift
var colors = ["Red", "Green", "Blue"]
```

Arrays can also be created with a repeating default value:

```swift
var values = Array(repeating: 2.0, count: 4)
print(values) // [2.0, 2.0, 2.0, 2.0]
```

Arrays can also be created by adding two or more existing arrays with compatible types:

```swift
var grades = [85, 76]
var scores = [99, 52, 78]

var allGrades = grades + scores
print(allGrades) // [85, 76, 99, 52, 78]
```
<br/>

### Accessing Arrays

To find out the number of items in an array, check its `count` property. Use the `isEmpty` property as a shortcut for checking whether the `count` property is equal to 0.

```swift
var friends = ["Chandler", "Joey"]
print(friends.count) // 2
print(friends.isEmpty) // false
```

To retrieve the value of a particular index, use subscript syntax:

```swift
var someone = friends[0]
print(someone) // Chandler
```
To safely access the first and last elements of an array, use `first` and `last` which will return `nil` if the array is empty.

```swift
if let firstFriend = friends.first, let lastFriend = friends.last {
    print(firstFriend) // Chandler
    print(lastFriend) // Joey
}
```

<br/>

### Adding Items to an Array

You can add a new item to the end of an array by calling the `append` method:

```swift
friends.append("Ross")
print(friends) // ["Chandler", "Joey", "Ross"]
```

Alternatively, you can append an array of one or more compatible items with the addition assignment operator:

```swift
friends += ["Phoebe", "Rachel"]
print(friends) // ["Chandler", "Joey", "Ross", "Phoebe", "Rachel"]
```
To insert an item at a specific index, use the `insert(_:at:)` method:

```swift
friends.insert("Monica", at: 3)
print(friends) // ["Chandler", "Joey", "Ross", "Monica", "Phoebe", "Rachel"]
```
You can also insert an array with compatible types at a specific index:

```swift
friends.insert(contentsOf: ["Gunther", "Janice"], at: 3)
print(friends) // ["Chandler", "Joey", "Ross", "Gunther", "Janice", "Monica", "Phoebe", "Rachel"]
```

<br/>

### Modifying Items in an Array

To change the value of an item at a specific index, use subscript syntax:

```swift
friends[4] = "Richard"
print(friends) // ["Chandler", "Joey", "Ross", "Gunther", "Richard", "Monica", "Phoebe", "Rachel"]
```
You can also use subscript syntax to change a range of values at once, even if the replacement set of values has a different length than the range you are replacing.

```swift
friends[2...4] = ["Mike", "Carol"]
print(friends) // ["Chandler", "Joey", "Mike", "Carol", "Monica", "Phoebe", "Rachel"]
```

<br/>

### Removing Items from an Array

You can remove the first or last elements from an array by using the `removeFirst` and `removeLast` functions respectively.

```swift
friends.removeFirst()
print(friends) // ["Joey", "Mike", "Carol", "Monica", "Phoebe", "Rachel"]

friends.removeLast()
print(friends) // ["Joey", "Mike", "Carol", "Monica", "Phoebe"]
```
> Note: `popLast()` is the same as `removeLast()` except that it returns an optional value which means you can safely call it on an empty array.

To remove an element at a specific index, use the `remove(_:at:)` function. This function, as well as the two mentioned above, return the removed item, which you can either use or ignore:

```swift
let removedFriend = friends.remove(at: 2)
print(removedFriend) // Carol
print(friends) // ["Joey", "Mike", "Monica", "Phoebe"]
```

To remove a range of values, use the subscript syntax with a range of the indexes you wish to remove:

```swift
friends[1...2] = []
print(friends) // ["Joey", "Phoebe"]
```

To empty an array, you can either use the `removeAll` function with provides you the option of maintaining the capacity of the array, or you can simply assign the array to an empty array indicated by `[]`:

```swift
friends.removeAll(keepingCapacity: true)
print(friends) // []
print(friends.capacity) // 8

friends = []
print(friends.capacity) // 0
```

<br/>

### Iterating over Arrays

You can easily iterate over an array by using a `for-in` loop:

```swift
let groceryList = ["Broccoli", "Carrots", "Potatoes"]

for item in groceryList {
    print(item)
}
// Broccoli
// Carrots
// Potatoes
```

Alternatively, you can use `forEach` which will call a closure on each element of the array:

```swift
groceryList.forEach { item in
    print(item)
}
// Broccoli
// Carrots
// Potatoes
```
> Note: When using `forEach` you cannot use `continue` or `break` to skip iterations or exit out of the loop. Using `return` will only exit from the current call of the closure and won't skip subsequent calls.

If you need the integer index of each item as well as its value, use the `enumerated()` method to iterate over the array instead.

```swift
for (index, value) in groceryList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Broccoli
// Item 2: Carrots
// Item 3: Potatoes
```

Alternatively, you can iterate over an array with access to the index by creating a for-in loop with a range:

```swift
for i in 0..<groceryList.count {
    print("Item \(i + 1): \(groceryList[i])")
}
// Item 1: Broccoli
// Item 2: Carrots
// Item 3: Potatoes
```

<br/>

### Searching Arrays

<br/>

### [Copying Arrays](https://developer.apple.com/documentation/swift/array#Modifying-Copies-of-Arrays)

Arrays are *value* types which means that if you copy an array, a brand new array is created with a unique copy of the values inside. Any changes to the new array will not affect the original array and vice versa.

```swift
var letters = ["A", "B", "C"]
var lettersCopy = letters

letters[0] = "K"
lettersCopy[1] = "Z"

print(letters) // ["K", "B", "C"]
print(lettersCopy) // ["A", "Z", "C"]
```
> Behind the scenes, Swift uses *copy-on-write optimization* which means that multiple copies of an array will share the same storage until one of the copies is modified.

However, if you copy an array that stores reference types (such as class instances), this behaviour appears to be different (even though it is not). This is because the values stored in the array are *references to objects that live outside the array*. The copied array copies the *references*, not the values those references point to.

Take a look at the following example where we have an array of `Person` objects and a copy of that array.

```swift
class Person {
    var name: String

    init(_ name: String) {
        self.name = name
    }
}

var people = [Person("Michael"), Person("Jim"), Person("Pam")]
var peopleCopy = people
```

If we modify an instance of `Person` that is referenced by both arrays, that change can be observed in both arrays:

```swift
people[0].name = "Dwight"
print(peopleCopy[0].name) // Dwight
```

However, if we replace the reference in an array with a reference to a different object instance, this change is not reflected in the other array:

```swift
people[0] = Person("Angela")
print(people[0].name) // Angela
print(peopleCopy[0].name) // Dwight
```

<br/>

## Sets

<br/>

## Dictionaries


To Do
- firstIndex (finding)

## Links

* [Apple Documentation on Collection Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes)
* [Apple Documentation on Arrays](https://developer.apple.com/documentation/swift/array)
* [Array Transformations](https://developer.apple.com/documentation/swift/array/map(_:)-87c4d)