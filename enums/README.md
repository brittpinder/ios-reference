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

You can easily iterate over the values of an enum by having it inherit from 'CaseIterable' and then accessing the '.allValues' property.

```swift
enum Direction: CaseIterable {
    case up
    case down
    case left
    case right
}

for direction in Direction.allCases {
    print(direction)
}
```

