import Foundation

enum CompassDirection {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var favouritePlanet = Planet.mars
favouritePlanet = .jupiter

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

enum Pet: Int {
    case dog = 4
    case cat = 2
    case bird = 56
    case fish = -3
}

print(Pet.cat.rawValue) // 2

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

enum Color: Int {
    case blue = 1
    case red
    case yellow
    case green
}

print(Color.yellow.rawValue) // 3

enum Suit: String {
    case heart
    case diamond
    case spade
    case club
}

print(Suit.diamond.rawValue) // diamond

let possibleColor = Color(rawValue: 2)
print(possibleColor) // Optional(Color.red)

let anotherPossibleColor = Color(rawValue: 7)
print(anotherPossibleColor) // nil


enum Mark {
    case gpa(Float)
    case grade(String)
}

var mark = Mark.gpa(3.8)
mark = Mark.grade("A+")

enum Transform {
    case position(x: Double, y: Double, z: Double)
    case rotation(x: Double, y: Double, z: Double)
    case scale(Double)
}

let transforms = [Transform.position(x: 2.0, y: 0.0, z: 10.0), Transform.scale(0.5)]

for transform in transforms {
    // Apply transform
}

enum Season: String {
    case sprint
    case summer
    case autumn
    case winter
    func displayString() -> String { return self.rawValue.capitalized }
}
print(Season.summer.displayString()) // Summer

