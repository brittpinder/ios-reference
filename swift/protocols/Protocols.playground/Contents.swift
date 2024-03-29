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

class Insect: Legged {
    let numberOfLegs = 6
}

class Table: Legged {
    var numberOfLegs = 4
}

class Frog: Legged {
    enum LifeStage {
        case egg, tadpole, adult
    }
    var lifeStage: LifeStage = .egg

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

//class Alien: Legged {
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

protocol BossDelegate {
    func doWork()
}

//struct Boss {
//    func work() {
//        print("Boss is doing the work")
//    }
//}

struct Boss {
    var delegate: BossDelegate?

    func work() {
        if let delegate {
            delegate.doWork()
        } else {
            print("Boss is doing the work")
        }
    }
}

struct Employee: BossDelegate {
    func doWork() {
        print("Employee is doing the work")
    }
}

struct Intern: BossDelegate {
    func doWork() {
        print("Intern is doing the work")
    }
}

var boss = Boss()
boss.work() // Boss is doing the work

let employee = Employee()
boss.delegate = employee
boss.work() // Employee is doing the work

let intern = Intern()
boss.delegate = intern
boss.work() // Intern is doing the work

// ----------------------------------------

//class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // Implementation details
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // Implementation details
//        return true
//    }
//}

class ViewController: UIViewController {

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Implementation details
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Implementation details
        return true
    }
}

// ----------------------------------------

struct Spider {
    let type: String
    let numberOfLegs = 8
}

extension Spider: Legged {}

// ----------------------------------------

extension Array: Legged where Element == any Legged {
    var numberOfLegs: Int {
        return self.map { $0.numberOfLegs }.reduce(0,+)
    }
}

let leggyThings: [Legged] = [Table(), Spider(type: "Black Widow"), Frog()]
print(leggyThings.numberOfLegs) // 12

// ----------------------------------------

protocol Parrot: Named, FlyingObject {
    func speak()
}

struct Parakeet: Parrot {
    var name: String

    func fly() {
        print("The parakeet is flying away")
    }

    func speak() {
        print("My name is \(name)")
    }
}

// ----------------------------------------

protocol SomeClassOnlyProtocol: AnyObject {

}

// ----------------------------------------

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy Birthday \(celebrator.name)! You are \(celebrator.age) years old.")
}

let helen = Person(name: "Helen", age: 60)
wishHappyBirthday(to: helen) // Happy Birthday Helen! You are 60 years old.

// ----------------------------------------

var objects: [AnyObject] = [Insect(), Airplane(), Image(x: 0, y: 0), Table()]

for object in objects {
    if let leggedObject = object as? Legged {
        print("Object has \(leggedObject.numberOfLegs) legs")
    } else {
        print("Object doesn't have legs")
    }
}
// Object has 6 legs
// Object doesn't have legs
// Object doesn't have legs
// Object has 4 legs

// ----------------------------------------

@objc protocol ButtonDelegate {
    @objc optional func leftButtonClicked()
    @objc optional func rightButtonClicked()
}

class Game: ButtonDelegate {
    func leftButtonClicked() {
        // Do something
    }
}

// ----------------------------------------

extension FlyingObject {
    func land() {
        print("Flying back to the ground")
    }
}

let eagle = Eagle()
eagle.land() // Flying back to the ground

// ----------------------------------------

extension FlyingObject {
    func fly() {
        print("The object flies through the sky")
    }
}

struct UFO: FlyingObject {}

let ufo = UFO()
ufo.fly() // The object flies through the sky

// ----------------------------------------

extension Array where Element == any Legged {
    func allHaveFourLegs() -> Bool {
        for element in self {
            if element.numberOfLegs != 4 {
                return false
            }
        }
        return true
    }
}

let leggyObjects: [Legged] = [Table(), Frog(), Insect()]
print(leggyObjects.allHaveFourLegs()) // false

// ----------------------------------------

//struct Point {
//    var x: Int
//    var y: Int
//
//    static func == (left: Point, right: Point) -> Bool {
//        return left.x == right.x && left.y == right.y
//    }
//}

struct Point: Equatable {
    var x: Int
    var y: Int
}

let point1 = Point(x: 2, y: 3)
let point2 = Point(x: 2, y: 3)

print(point1 == point2)
