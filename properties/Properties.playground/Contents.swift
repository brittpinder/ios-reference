import Foundation

//struct Person {
//    let name: String
//    var age: Int
//}
//
//var person = Person(name: "Audrey", age: 25)
//person.name = "Barbara" // Error: name is a let constant
//person.age = 33
//
//let constantPerson = Person(name: "Jake", age: 12)
//constantPerson.age = 70 // Error: constantPerson is a let constant

class Person {
    let name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var person = Person(name: "Audrey", age: 25)
//person.name = "Barbara" // Error: name is a let constant
person.age = 33

let constantPerson = Person(name: "Jake", age: 12)
constantPerson.age = 70 // This is ok
//constantPerson = Person("Amy", 39) // Error: Cannot assign to value: constantPerson is a let constant
