import Foundation


// Basic Example
class Shape {
    var color = "blue"

    func draw() {
        print("Drawing a \(color) shape")
    }
}

class Circle: Shape {
    var radius = 50

    override func draw() {
        print("Drawing a \(color) circle with radius \(radius)")
    }
}

let shape = Shape()
shape.draw() // Drawing a blue shape

let circle = Circle()
circle.color = "green"
circle.draw() // Drawing a green circle with radius 50



// Overriding Init
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

//class Student: Person {
//    var grade: Int
//
//    init(name: String, age: Int, grade: Int) {
//        self.grade = grade
//        super.init(name: name, age: age)
//    }
//}
//
//var student = Student(name: "Wesley", age: 19, grade: 85)
//print(student.name) // Wesley
//print(student.grade) // 85


class Student: Person {
    var grade: Int

    override init(name: String, age: Int) {
        self.grade = 50
        super.init(name: name, age: age)
    }
}

var student = Student(name: "Wesley", age: 19)
print(student.name) // Wesley
print(student.grade) // 50



// Overriding Properties
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) km/h"
    }
}

class Car: Vehicle {
    var gear: Int = 1

    override var description: String {
        return super.description + " in gear \(gear)"
    }

    override var currentSpeed: Double {
        didSet {
            gear = Int(self.currentSpeed / 30)
        }
    }
}


var myCar = Car()
myCar.currentSpeed = 65
print(myCar.description) // traveling at 65.0 km/h in gear 2




// Final

final class A { }

//class B: A { } // Error: Inheritance from a final class 'A'

class Fish {
    final func swim() {
        print("Just keep swimming")
    }
}

class Goldfish: Fish {
//    override func swim() { // Error: Instance method overrides a 'final' instance method
//
//    }
}





// Polymorphism
class Pet {
    func speak() {
        print("...")
    }
}

class Dog: Pet {
    override func speak() {
        print("Woof")
    }
}

class Husky: Dog {
    override func speak() {
        print("Awwwooooo")
    }
}

func makeNoise(with pet: Pet) {
    pet.speak()
}

makeNoise(with: Pet()) // ...
makeNoise(with: Dog()) // Woof
makeNoise(with: Husky()) // Awwwooooo



// Type Checking
let pets = [Pet(), Dog(), Dog(), Pet(), Husky()]

var numDogs = 0

for pet in pets {
    if pet is Dog {
        numDogs += 1
    }
}

print("There are \(numDogs) dogs") // There are 3 dogs



// Type Casting
class Animal {
    func identify() {
        print("I am an animal")
    }
}

class Bird: Animal {
    override func identify() {
        print("I am a bird")
    }

    func fly() {
        print("Flapping wings")
    }
}

class Reptile: Animal {
    override func identify() {
        print("I am a reptile")
    }

    func shedSkin() {
        print("Shedding skin")
    }
}

// Optional Downcasting
let animals: [Animal] = [Bird(), Reptile(), Bird()]

for animal in animals {
    if let reptile = animal as? Reptile {
        reptile.shedSkin()
    } else if let bird = animal as? Bird {
        bird.fly()
    }
}
// Flapping wings
// Shedding skin
// Flapping wings

for reptile in animals as? [Reptile] ?? [Reptile]() {
    reptile.shedSkin()
}
// Prints nothing


// Forced Downcasting
var birds: [Animal] = [Bird(), Bird(), Bird()]

for animal in birds {
    let bird = animal as! Bird
    bird.fly()
}
// Flapping Wings
// Flapping Wings
// Flapping Wings

for bird in birds as! [Bird] {
    bird.fly()
}
// Flapping Wings
// Flapping Wings
// Flapping Wings



// Upcasting
let bird: Bird = Bird()
bird.identify() // I am a bird

let animal: Animal = bird as Animal
animal.identify() // I am a bird
//animal.fly() // Error: Value of type 'Animal' has no member 'fly'


