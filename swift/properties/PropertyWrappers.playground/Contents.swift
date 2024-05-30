import UIKit

struct Person {
    var firstName: String {
        didSet {
            firstName = firstName.capitalized
        }
    }
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }

    init(firstName: String, lastName: String) {
        self.firstName = firstName.capitalized
        self.lastName = lastName.capitalized
    }

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

var person = Person(firstName: "fred", lastName: "flinstone")
print(person.fullName)

person.lastName = "weasley"
print(person.fullName)

person.firstName = "george"
print(person.fullName)

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.capitalized
        }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}


struct Person1 {
    @Capitalized var firstName: String
    @Capitalized var lastName: String

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

var person1 = Person1(firstName: "taylor", lastName: "swift")
print(person1.fullName)

person1.firstName = "austin"
print(person1.fullName)
