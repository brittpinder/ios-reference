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


class Dog {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func bark() {
        print("Woof")
    }
}

var dog = Dog(name: "Aayla", age: 5)
var otherDog = dog
otherDog.name = "Jango"

print(dog.name) // "Jango"
print(otherDog.name) // "Jango"

