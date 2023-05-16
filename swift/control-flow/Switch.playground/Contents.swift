import UIKit

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

let someCharacter: Character = "z"

switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// "The last letter of the alphabet"

// -------------------------------------------

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

// -------------------------------------------

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

print(getTicketPrice(for: 1))
print(getTicketPrice(for: 6))
print(getTicketPrice(for: 18))
print(getTicketPrice(for: 40))
print(getTicketPrice(for: 72))

// -------------------------------------------

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

describePoint((1, 1))  // Prints "(1, 1) is inside the box"
describePoint((0, 7))  // (0, 7) is on the y-axis
describePoint((-4, 2)) // (-4, 2) is outside of the box
describePoint((0, 0))  // (0, 0) is at the origin
