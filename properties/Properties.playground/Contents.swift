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

struct File {
    var name: String
    let fileExtension: String

    // A computed property that generates a filename
    var filename: String {
        return name + "." + fileExtension
    }
}

let file = File(name: "house", fileExtension: "png")
print(file.filename)

//file.filename = "chair.png" // Error: Cannot assign to property: 'filename' is a get-only property

struct UIntRange {
    var start: UInt
    var length: UInt
    var end: UInt {
        get {
            return start + length
        }
        set {
            start = newValue - length
        }
    }
}

var range = UIntRange(start: 2, length: 5)
print(range.end) // 7

range.end = 10
print(range.start) // 5

struct Content {
    private var file: File

    var name: String {
        get {
            file.name
        }
        set {
            file.name = newValue
        }
    }
}
