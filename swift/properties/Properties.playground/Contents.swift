import UIKit

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

//class Person {
//    let name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//var person = Person(name: "Audrey", age: 25)
//person.name = "Barbara" // Error: name is a let constant
//person.age = 33
//
//let constantPerson = Person(name: "Jake", age: 12)
//constantPerson.age = 70 // This is ok
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

extension UIView {
    var width: CGFloat {
        return frame.size.width
    }

    var height: CGFloat {
        return frame.size.height
    }
}

class University {
    var tuition: Int {
        return 1000
    }
}

class Carleton: University {
    override var tuition: Int {
        return 2000
    }
}

//class University {
//    var tuition: Int = 1000
//}
//
//class Carleton: University {
//    override var tuition: Int = 2000 // Cannot override stored property 'tuition'
//}

//struct Person {
//    let name: String
//    let age: Int
//}
//
//struct Family {
//    let members: [Person]
//
//    lazy var youngest: Person? = {
//        print("Youngest initialized")
//        return members.min(by: {$0.age < $1.age})
//    }()
//
//    init(members: [Person]) {
//        self.members = members
//        print("Family initialized")
//    }
//}
//
//var family = Family(members: [Person(name: "Dianne", age: 60),
//                              Person(name: "Harry", age: 58),
//                              Person(name: "Brittany", age: 33),
//                              Person(name: "Warren", age: 31)]) // Prints: "Family initialized"
//
//print(family.youngest)
//// Prints: "Youngest initialized"
//// Prints: "Person(name: "Warren", age: 31)"


struct Person {
    let name: String
    let age: Int
}

struct Family {
    var members: [Person]

    lazy var youngest: Person? = {
        print("Youngest initialized")
        return members.min(by: {$0.age < $1.age})
    }()

    init(members: [Person]) {
        self.members = members
        print("Family initialized")
    }
}

var family = Family(members: [Person(name: "Dianne", age: 60),
                              Person(name: "Harry", age: 58),
                              Person(name: "Brittany", age: 33),
                              Person(name: "Warren", age: 31)]) // Prints: "Family initialized"

print(family.youngest)
// Prints: "Youngest initialized"
// Prints: "Person(name: "Warren", age: 31)"

family.members.append(Person(name: "Baby", age: 1))
print(family.youngest)
// Prints: "Person(name: "Warren", age: 31)"

struct Hero {
    var strength: Int {
        willSet {
            print("Strength is about to be changed from \(strength) to \(newValue)")
        }
        didSet {
            print("Strength was changed from \(oldValue) to \(strength)")
        }
    }
}

var hero = Hero(strength: 10)
hero.strength = 20
// Prints: "Strength is about to be changed from 10 to 20"
// Prints: "Strength was changed from 10 to 20"

func doSomething(strength: inout Int) {
    print("Doing something")
}

doSomething(strength: &hero.strength)
// Prints: "Doing something"
// Prints: "Strength is about to be changed from 20 to 20"
// Prints: "Strength was changed from 20 to 20"

