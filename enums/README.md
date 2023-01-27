# Enums

## Syntax

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
When you’re working with enumerations that store integer or string raw values, you don’t have to explicitly assign a raw value for each case. When you don’t, Swift automatically assigns the values for you.

For example, when integers are used for raw values, the implicit value for each case is one more than the previous case. If the first case doesn’t have a value set, its value is 0.

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

## Associated Values of Different Types
In Swift it is possible to store associated values that are different for each case of the enumeration.

In the below example, a Mark can be stored as a gpa (ex: 3.5, 4.0, 2.6) or a grade (ex: A+, B-, F)

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
    case position(x: Double, y: Double, z: Double)
    case rotation(x: Double, y: Double, z: Double)
    case scale(Double)
}

let transforms = [Transform.position(x: 2.0, y: 0.0, z: 10.0), Transform.scale(0.5)]

for transform in transforms {
    // Apply transform
}
```

## Enum Functions
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

