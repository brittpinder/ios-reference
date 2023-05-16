# [Control Flow](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/)

<br/>

## [Switch](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Switch)

Switch statements in Swift are much more powerful than switch statements in C and these featuers will be discussed later on. However, in its most basic form, a switch statement looks very similar to those in other languages. It considers a value, compares it against several possible matching values and then executes an appropriate block of code based on the first value that matches successfully:

```swift
enum Shape {
    case Rock, Paper, Scissors
}

var shape = Shape.Paper

switch shape {
case .Rock:
    print("You chose Rock")
case .Paper:
    print("You chose Paper")
case .Scissors:
    print("You chose Scissors")
}
// You chose paper
```

The code block for a switch case can have multiple statements without the need for curly brackets:

```swift
switch shape {
case .Rock:
    print("You chose Rock")
    print("Rock beats scissors")
case .Paper:
    print("You chose Paper")
    print("Paper beats rock")
case .Scissors:
    print("You chose Scissors")
    print("Scissors beats paper")
}
// You chose Paper
// Paper beats rock
```

Switch cases must be exhaustive. If it's not appropriate or possible to provide a case for every possible value, you can define a default case:

```swift
let someCharacter: Character = "z"

switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// Prints "The last letter of the alphabet"
```

<br/>

### [No Implicit Fallthrough](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#No-Implicit-Fallthrough)

In contrast with switch statements in C and Objective-C, switch statements in Swift don’t fall through the bottom of each case and into the next one by default. Instead, the entire switch statement finishes its execution as soon as the first matching switch case is completed, without requiring an explicit break statement. This makes the switch statement safer and easier to use than the one in C and avoids executing more than one switch case by mistake.

For example, you might be tempted to write the following, expecting that the lower case 'a' would fall through to the capital case 'A'. However, every case must have at least one executable statement so this wouldn't compile.

```swift
let anotherCharacter: Character = "a"

switch anotherCharacter {
case "a": // Error: 'case' label in a 'switch' must have at least one executable statement
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}
```

This can be resolved by adding the keyword `fallthrough`, telling the compiler that you wish to opt-in to fall through behaviour:

```swift
let anotherCharacter: Character = "a"

switch anotherCharacter {
case "a":
    fallthrough
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// The letter A
```
> Note: This problem can also be solved using [Compound Cases](#compound-cases)

<br/>

### [Interval Matching](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Interval-Matching)

Values in switch cases can be checked for their inclusion in an interval. For example, the following switch case returns a price for a ticket based on the age of a person (infant, child, adult, senior):

```swift
func getTicketPrice(for age: UInt) -> Double {
    switch age {
    case 0..<2:
        return 0
    case 2..<18:
        return 24.99
    case 18..<65:
        return 49.99
    case 65..<100:
        return 39.00
    default:
        return 0
    }
}
```

<br/>

### [Tuple Matching](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Tuples)

Tuples can be used to test multiple values within the same switch statement. Each element of the tuple can be tested against a different value or interval of values. You can even use the wildcard pattern (`_`) to match any possible value.

For example, the following switch case describes where a point lies on a graph depending on its x and y values:

```swift
func describePoint(_ point: (Int, Int)) {
    switch point {
    case (0, 0):
        print("\(point) is at the origin")
    case (_, 0):
        print("\(point) is on the x-axis")
    case (0, _):
        print("\(point) is on the y-axis")
    case (-2...2, -2...2):
        print("\(point) is inside the box")
    default:
        print("\(point) is outside of the box")
    }
}

describePoint((1, 1))  // (1, 1) is inside the box
describePoint((0, 7))  // (0, 7) is on the y-axis
describePoint((-4, 2)) // (-4, 2) is outside of the box
describePoint((0, 0))  // (0, 0) is at the origin
```

> Note: Unlike C, Swift allows multiple switch cases to consider the same value or values. In fact, the point (0, 0) could match all four of the cases in this example. However, if multiple matches are possible, the first matching case is always used.

<br/>

### [Value Bindings](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Value-Bindings)

A switch case can name the value or values it matches to temporary constants or variables, for use in the body of the case:

```swift
let point = (2, 0)

switch point {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// on the x-axis with an x value of 2
```

For another example of value bindings, see [Enums](https://github.com/brittpinder/ios-reference/tree/main/swift/enums#associated-values-of-different-types)

<br/>

### [Where Clauses](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Where)

A switch case can use a where clause to check for additional conditions:

```swift
let anotherPoint = (1, -1)

switch anotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// (1, -1) is on the line x == -y
```

<br/>

### [Compound Cases](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Compound-Cases)

Instead of using `fallthrough`, multiple switch cases that share the same body can be combined by writing several patterns after `case`, with a comma between each of the patterns. If any of the patterns match, then the case is considered to match. 

```swift
let character: Character = "Z"

switch someCharacter {
case "a", "A":
    print("The first letter of the alphabet")
case "z", "Z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// The last letter of the alphabet
```
Compound cases can also include value bindings. For example, the following switch statement has a compound case that matches any point that lies on an axis:

```swift
let somePoint = (9, 0)

switch somePoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// On an axis, 9 from the origin
```
