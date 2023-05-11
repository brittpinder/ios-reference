import UIKit

protocol FlyingObject {
    func fly()
}

struct Eagle: FlyingObject {
    func fly() {
        print("The eagle soars through the air")
    }
}

class Airplane: FlyingObject {
    func fly() {
        print("The airplane takes off")
    }
}

func makeObjectFly(object: FlyingObject) {
    object.fly()
}

let flyingThing: FlyingObject = Eagle()
makeObjectFly(object: flyingThing) // The eagle soars through the air
makeObjectFly(object: Airplane()) // The airplane takes off

let flyingObjects: [FlyingObject] = [Airplane(), Eagle(), Airplane()]

// ----------------------------------------

protocol Togglable {
    mutating func toggle()
}

enum LightSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = LightSwitch.off
lightSwitch.toggle()
print(lightSwitch) // on

// ----------------------------------------

protocol Positioned {
    init(x: Int, y: Int)
}

struct Sprite: Positioned {
    init(x: Int, y: Int) {
        // Implementation details
    }
}

class Image: Positioned {
    required init(x: Int, y: Int) {
        // Implementation details
    }
}

// ----------------------------------------

protocol Legged {
    var numberOfLegs: Int { get }
}

struct Insect: Legged {
    let numberOfLegs = 6
}

struct Table: Legged {
    var numberOfLegs = 4
}

struct Frog: Legged {
    enum LifeStage {
        case egg, tadpole, adult
    }
    var lifeStage: LifeStage

    var numberOfLegs: Int {
        switch lifeStage {
        case .egg:
            return 0
        case .tadpole:
            return 2
        case .adult:
            return 4
        }
    }
}

//struct Alien: Legged {
//    private var numberOfLegs: Int // Error: Property 'numberOfLegs' must be declared internal
//}

// ----------------------------------------

protocol Named {
    var name: String { get set }
}

struct Dog: Named {
    var name: String
}

//struct Cat: Named {
//    let name: String // Error: Type 'Cat' does not conform to protocol 'Named'
//}
//
//struct City: Named {
//    private(set) var name: String // Error: Setter for property 'name' must be declared internal
//}
//
//struct Human: Named { // Error: Type 'Human' does not conform to protocol 'Named'
//    var firstName: String
//    var lastName: String
//
//    var name: String {
//        return firstName + " " + lastName
//    }
//}

// ----------------------------------------
