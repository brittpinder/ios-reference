import Foundation

struct SomeStructure {
    // structure definition goes here
}

class SomeClass {
    // class definition goes here
}

//struct Dog {
//    var name: String
//    var age: Int
//
//    func bark() {
//        print("Woof")
//    }
//}
//
//var dog = Dog(name: "Aayla", age: 5) // Using default init

//struct Dog {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    func bark() {
//        print("Woof")
//    }
//}
//
//var dog = Dog(name: "Aayla", age: 5)
//var otherDog = dog
//otherDog.name = "Jango"
//
//print(dog.name) // "Aayla"
//print(otherDog.name) // "Jango"



//class Dog {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    func bark() {
//        print("Woof")
//    }
//}
//
//var dog = Dog(name: "Aayla", age: 5)
//var otherDog = dog
//otherDog.name = "Jango"
//
//print(dog.name) // "Jango"
//print(otherDog.name) // "Jango"
//print(dog === otherDog) // true
//print(dog !== otherDog) // false



//struct Dog {
//    var name: String
//    var age: Int
//    var toys: [String]
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//        self.toys = [String]()
//    }
//
//    mutating func addToy(toy: String) { // This is ok
//        toys.append(toy)
//    }
//}
//
//var dog = Dog(name: "Aayla", age: 5)
//dog.toys.append("Simba")
//
//let otherDog = Dog(name: "Jango", age: 1)
//otherDog.addToy(toy: "Rooster") // Error: Cannot use mutating member on immutable value `otherDog`



class Dog {
    var name: String
    var age: Int
    var toys: [String]

    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.toys = [String]()
    }

    func addToy(toy: String) {
        toys.append(toy)
    }
}

var dog = Dog(name: "Aayla", age: 5)
dog.addToy(toy: "Simba")

let otherDog = Dog(name: "Jango", age: 1)
otherDog.addToy(toy: "Rooster")
