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

enum Beverage: String {
    case water = "Water"
    case juice = "Juice"
    case tea = "Tea"
}

print(Beverage.juice.rawValue) // Juice

enum Color: Int {
    case blue = 1
    case red
    case yellow
}

print(Color.yellow.rawValue) // 3

enum Suit: String {
    case heart
    case diamond
    case spade
    case club
}

print(Suit.diamond.rawValue) // diamond
