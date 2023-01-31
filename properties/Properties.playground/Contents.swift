import Foundation

struct Person {
    let name: String
    var age: Int
}

var person = Person(name: "Audrey", age: 25)
//person.name = "Barbara" // Error: name is a let constant
person.age = 33

let constantPerson = Person(name: "Jake", age: 12)
//constantPerson.age = 70 // Error: constantPerson is a let constant

class Employee {
    let name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var employee = Employee(name: "Sarah", age: 35)
//employee.name = "Marie" // Error: name is a let constant
employee.age = 40

let constantEmployee = Employee(name: "Michael", age: 42)
constantEmployee.age = 39 // This is ok
//constantEmployee = Employee("Dwight", 39) // Error: Cannot assign to value: constantEmployee is a let constant
