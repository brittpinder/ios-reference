# Enums


Each enum value is defined using the keyword `case`

```swift
enum CompassDirection {
    case north
    case south
    case east
    case west
}
```

Multiple cases can appear on one line, separated by commas.

```swift
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
```
The type of a variable is inferred when it’s initialized to a possible enum value. You can then set it to a different enum value using "dot syntax":

```swift
var favouritePlanet = Planet.mars
favouritePlanet = .jupiter
```
<br/>

## Iteration
You can easily iterate over the values of an enum by having it inherit from `CaseIterable` and then accessing the `.allCases` property.

```swift
enum Direction: CaseIterable {
    case up
    case down
    case left
    case right
}

print("There are \(Direction.allCases.count) possible directions.")
// There are 4 possible directions

for direction in Direction.allCases {
    print(direction)
}
// up
// down
// left
// right
```
<br/>

## Raw Values
Enumeration cases can come prepopulated with default values (called raw values), which are all of the same type. Raw values can be strings, characters, or any of the integer or floating-point number types. Each raw value must be unique within its enumeration declaration.

Here is an example of an enumeration that stores integer values:

```swift
enum Pet: Int {
    case dog = 4
    case cat = 2
    case bird = 56
    case fish = -3
}

print(Pet.cat.rawValue) // 2
```
Here is an example of an enumeration that stores strings:

```swift
enum Weekday: String {
    case mon = "Monday"
    case tue = "Tuesday"
    case wed = "Wednesday"
    case thu = "Thursday"
    case fri = "Friday"
    case sat = "Saturday"
    case sun = "Sunday"
}

print(Weekday.fri.rawValue) // Friday
```

### Implicitly Assigned Raw Values

If you don't explicitly assign raw values to enumerations that store an integer or string, Swift will automatically assign raw values for you.

For example, when integers are used as raw values, the implicit value for each case is one more than the previous case. If the first case doesn’t have a value set, its value is 0.

```swift
enum Color: Int {
    case blue = 1
    case red
    case yellow
    case green
}

print(Color.yellow.rawValue) // 3
```
When strings are used for raw values, the implicit value for each case is the text of that case’s name.

```swift
enum Suit: String {
    case heart
    case diamond
    case spade
    case club
}

print(Suit.diamond.rawValue) // diamond
```

### Initializing from a Raw Value
You can attempt to convert a raw value to an enumeration type using the "rawValue" initializer. When doing so you will receive an optional enum value. In the example below, the variables are of type `Color?`

```swift
let possibleColor = Color(rawValue: 2)
print(possibleColor) // Optional(Color.red)

let anotherPossibleColor = Color(rawValue: 7)
print(anotherPossibleColor) // nil
```
This implicitly defined initializer is referred to as a [Failable Initializer](https://github.com/brittpinder/ios-reference/tree/main/swift/initialization#failable-initializers).

<br/>

## Associated Values of Different Types
In Swift it is possible to store associated values that are different for each case of the enumeration. In the below example, a Mark can be stored as a gpa (ex: 3.5, 4.0, 2.6) or a grade (ex: A+, B-, F)

```swift
enum Mark {
    case gpa(Float)
    case grade(String)
}

var mark = Mark.gpa(3.8)
mark = Mark.grade("A+")
```

You can even store tuples as the value of an enumeration. For example, a transformation type that only allows uniform scaling (equal x, y and z) could be expressed like this:

```swift
enum Transform {
    case translate(x: Double, y: Double, z: Double)
    case rotate(x: Double, y: Double, z: Double)
    case scale(Double)
}

let transforms = [Transform.translate(x: 2.0, y: 0.0, z: 10.0), Transform.scale(0.5)]

for transform in transforms {
    // Apply transform
}
```
When evaluating enum cases in a switch statement, the associated values can be extracted using the `let` or `var` prefix. You will have to give the associated values names.

```swift
enum YearMark {
    case gpa(Float, Float)
    case grade(String, String)
}

let yearMark = YearMark.grade("B+", "C-")

switch yearMark {
    case .gpa(let firstSemester, let secondSemester):
        print("GPA: \(firstSemester), \(secondSemester)")
    case .grade(var firstSemester, var secondSemester):
        print("Grade: \(firstSemester), \(secondSemester)")
}
```
If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single `var` or `let` annotation before the case name, for brevity:

```swift
switch yearMark {
    case let .gpa(firstSemester, secondSemester):
        print("GPA: \(firstSemester), \(secondSemester)")
    case var .grade(firstSemester, secondSemester):
        print("Grade: \(firstSemester), \(secondSemester)")
}
```
<br/>

## Recursive Enumerations

A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing `indirect` before it, which tells the compiler to insert the necessary layer of indirection.

For example, here is an enumeration that stores simple arithmetic expressions:

```swift
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```
You can also write indirect before the beginning of the enumeration to enable indirection for all of the enumeration’s cases that have an associated value:

```swift
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

```
The power of recursive enums can be shown in the following example:

```swift
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

print(evaluate(product)) // (5 + 4) * 2 = 18
```
<br/>

## Enums with Computed Properties
Enums cannot have stored properties, but they can have computed properties:

```swift
enum Device {
  case iPad
  case iPhone

  var year: Int {
    switch self {
      case .iPhone: return 2007
      case .iPad: return 2010
    }
  }
}

let device = Device.iPhone
print(device.year) // 2007
```
<br/>

## Enums with Functions
Functions can be added to enums like so

```swift
enum Season: String {
    case sprint
    case summer
    case autumn
    case winter
    func displayString() -> String { return self.rawValue.capitalized }
}
print(Season.summer.displayString()) // Summer
```
<br/>

## Enums with Static Functions

```swift
enum Currency {
    case cad
    case sek
    case usd

    static func getDisplayString(currency: Currency) -> String {
        switch currency {
            case .cad: return "Canadian Dollars"
            case .sek: return "Swedish Krona"
            case .usd: return "US Dollars"
        }
    }
}

print(Currency.getDisplayString(currency: Currency.sek)) // Swedish Krona
```
<br/>

## Enums with Mutating Functions
You can simulate an enum having a state by having it mutate itself:

```swift
enum TrafficLight {
    case red
    case green
    case yellow

    mutating func next() {
        switch self {
            case .red: self = .green
            case .green: self = .yellow
            case .yellow: self = .red
        }
    }
}

var light = TrafficLight.red
light.next() // light is now equal to .green
light.next() // light is now equal to .yellow
```
<br/>

## Enums with Initializers
```swift
enum LifeStage {
    case infant
    case child
    case adult

    init(age: UInt) {
        switch age {
            case 0...1: self = .infant
            case 2...17: self = .child
            default: self = .adult
        }
    }
}

let lifeStage = LifeStage(age: 4)
print(lifeStage) // child
```
See also [Failable Initializers for Enumerations](https://github.com/brittpinder/ios-reference/tree/main/swift/initialization#failable-initializers-for-enumerations)

<br/>

## Helpful Links
* [Swift Documentation](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
* [ios-starter-kit](https://github.com/jrasmusson/ios-starter-kit/blob/master/basics/Enums/README.md)