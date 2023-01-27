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

enum Direction: CaseIterable {
    case up
    case down
    case left
    case right
}

for direction in Direction.allCases {
    print(direction)
}
