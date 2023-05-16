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

### No Implicit Fallthrough

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

<br/>

### Interval Matching

### Tuple Matching

### Value Bindings

### Where Clauses

### Compound Cases