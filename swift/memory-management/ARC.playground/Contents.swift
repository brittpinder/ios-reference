import UIKit

class Employee {
    let name: String

    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Employee? = Employee(name: "Michael Scott") // Michael Scott is being initialized

var reference2 = reference1
var reference3 = reference1

reference1 = nil
reference2 = nil

reference3 = nil // Michael Scott is being deinitialized


class Office {
    var name: String
    var employees = [Employee]()

    init(name: String) {
        self.name = name
    }

    func add(employee: Employee) {
        employees.append(employee)
    }
}

var office: Office? = Office(name: "Dunder Mifflin")
var dwight: Employee? = Employee(name: "Dwight Schrute") // Dwight Schrute is being initialized

office!.add(employee: dwight!)

dwight = nil
print(office!.employees[0].name) // Dwight Schrute

office = nil // Dwight Schrute is being deinitialized


print("\n\n")

class Person {
    let name: String
    var apartment: Apartment?

    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    var tenant: Person?

    init(unit: String) {
        self.unit = unit
        print("Apartment \(unit) is being initialized")
    }

    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person? = Person(name: "John") // John is being initialized
var unit4A: Apartment? = Apartment(unit: "4A") // Apartment 4A is being initialized

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

print("\n\n")

func memorySafeFunction() {
    var john = Person(name: "John") // John is being initialized
    var unit4A = Apartment(unit: "4A") // Apartment 4A is being intialized
}

memorySafeFunction()
// Apartment 4A is being deinitialized
// John is being deinitialized

func memoryUnsafeFunction() {
    var john = Person(name: "John") // John is being initialized
    var unit4A = Apartment(unit: "4A") // Apartment 4A is being intialized

    john.apartment = unit4A
    unit4A.tenant = john
}
memoryUnsafeFunction()
