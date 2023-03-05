import UIKit

// Assigning a default value
class Farenheit {
    var temperature: Double = 32.0
}

// Setting initial value within initializer
class Farenheit1 {
    var temperature: Double

    init() {
        temperature = 32.0
    }
}


struct Celsius {
    var temperatureInCelsius: Double

    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }

    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }

    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let bodyTemperature = Celsius(37.0)
print(bodyTemperature.temperatureInCelsius) // 37.0

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWater.temperatureInCelsius) // 100.0

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temperatureInCelsius) // 0.0


class Dog {
    var name: String
    var toy: String?

    init(name: String) {
        self.name = name
        // No need to set toy because it is an optional
    }
}


class Person {
    let name: String

    init(name: String) {
        self.name = name
    }
}

var person = Person(name: "Bob")
//person.name = "Robert" // Error: Cannot assign to property: 'name' is a let constant


//class ShoppingListItem {
//    var name: String?
//    var quantity = 1
//    var purchased = false
//}
//var item = ShoppingListItem()

struct ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
var anotherItem = ShoppingListItem(name: "Carrot", quantity: 3, purchased: true)


var bread = ShoppingListItem(name: "Bread", purchased: true)
var juice = ShoppingListItem(name: "Juice", quantity: 2)
var unknown = ShoppingListItem(quantity: 4)

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()

    init() {}

    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


class Polygon {
    var points: [Point]

    init(points: [Point]) {
        self.points = points
    }

    convenience init(squareWithLength length: CGFloat) {
        let points = [
            Point(x: 0, y: 0),
            Point(x: length, y: 0),
            Point(x: length, y: length),
            Point(x: 0, y: length),
        ]

        self.init(points: points)
    }
}


var square = Polygon(points: [Point(x: 0, y: 0),
                               Point(x: 4, y: 0),
                               Point(x: 4, y: 4),
                               Point(x: 0, y: 4)])

var convenientSquare = Polygon(squareWithLength: 4)




class Vehicle {
    var maxSpeed: Float

    init() {
        maxSpeed = 0
    }
}

class LandVehicle: Vehicle {
    var numberOfWheels: Int

    override init() {
        numberOfWheels = 0  // Initialize values introduced by this class
        super.init()        // Initialize inherited values
        maxSpeed = 100      // Customize inherited values
    }

    convenience init(bicycleWithMaxSpeed: Float) {
        self.init()         // Call designated initializer
        numberOfWheels = 2  // Customize inherited values and values introduced by this class
        maxSpeed = bicycleWithMaxSpeed
    }
}


let bicycle = LandVehicle(bicycleWithMaxSpeed: 20)
print(bicycle.maxSpeed)
print(bicycle.numberOfWheels)



class Student {
    let name: String

    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

let student1 = Student(name: "Bridget")
print(student1 == nil) // false

let student2 = Student(name: "")
print(student2 == nil) // true


let number = Int("34")
print(number) // Optional(34)


let anotherNumber = Int("three")
print(anotherNumber) // nil



enum MeasurementUnit {
    case millimeter, centimeter, meter, kilometer

    init?(symbol: String) {
        switch(symbol) {
        case "mm":
            self = .millimeter
        case "cm":
            self = .centimeter
        case "m":
            self = .meter
        case "km":
            self = .kilometer
        default:
            return nil
        }
    }
}

if MeasurementUnit(symbol: "cm") != nil {
    print("Initialization succeeded")
}

if MeasurementUnit(symbol: "centimeter") == nil {
    print("Initialization failed")
}


enum Suit: String {
    case heart
    case diamond
    case spade
    case club
}

let suit = Suit(rawValue: "spade")
print(suit) // Optional(Suit.spade)

let anotherSuit = Suit(rawValue: "clover")
print(anotherSuit) // nil



class Product {
    let name: String

    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int

    init?(name: String, quantity: Int) {
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

func createCartItem(name: String, quantity: Int) {
    if let _ = CartItem(name: name, quantity: quantity) {
        print("Initialization was successful")
    } else {
        print("Initialization failed")
    }
}

createCartItem(name: "Book", quantity: 1) // Initialization was successful
createCartItem(name: "Shirt", quantity: 0) // Initialization failed
createCartItem(name: "", quantity: 1) // Initialization failed





class Document {
    var name: String?

    init() {} // Creates a document with a nil name

    init?(name: String) { // Creates a document with a non-nil name
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }

    override init(name: String) { // Overrides failable initializer
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}


class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}


class Position {
    let x: Int
    let y: Int

    required init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

class VisitedPosition: Position {
    var isVisited: Bool

    init(x: Int, y: Int, isVisited: Bool) {
        self.isVisited = isVisited
        super.init(x: x, y: y)
    }

    required init(x: Int, y: Int) {
        self.isVisited = false
        super.init(x: x, y: y)
    }
}
