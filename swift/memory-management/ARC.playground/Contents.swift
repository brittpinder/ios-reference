import UIKit

class Person {
    let name: String

    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person? = Person(name: "Michael Scott") // Michael Scott is being initialized

var reference2 = reference1
var reference3 = reference1

reference1 = nil
reference2 = nil

reference3 = nil // Michael Scott is being deinitialized
