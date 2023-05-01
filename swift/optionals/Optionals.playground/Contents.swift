import UIKit

// Syntax
let shortForm: Int? = Int("42")
let longForm: Optional<Int> = Int("42")

// Basic optional
var optionalString: String?
print(optionalString) // nil
print(optionalString == nil) // true

optionalString = "Hello"
print(optionalString) // Optional("Hello")
print(optionalString == nil) // false



// Force Unwrapping
var age: Int? = 65

print(age) // Optional(65)
print(age!) // 65

// This will crash
//var age: Int?
//
//print(age) // nil
//print(age!) // Fatal error: Unexpectedly found nil while unwrapping an Optional value

if age != nil {
    print(age!) // 65
}



// Optional Binding with if let
var optionalName: String? = "Taylor"

if let name = optionalName {
    print(name)
} else {
    print("name is nil")
}
// prints "Taylor"

// print(name) // Cannot find 'name' in scope

if let optionalName {
    print("optionalName has a value of \(optionalName)")
}
// prints "optionalName has a value of Taylor"

var email: String? = "123@abc.com"
var password: String?

if let email, let password {
    print("Email: \(email), Password: \(password)")
}
// Nothing is printed because password doesn't contain a value



// Optional binding with guard let
func printGreeting(name: String?) {
    guard let safeName = name else {
        print("name does not have a value! Exiting function.")
        return
    }

    print("Hello \(safeName)")
}

printGreeting(name: nil) // name does not have a value! Exiting function.
printGreeting(name: "Gary") // Hello Gary



// Optional binding with switch
var name: String? = "Taylor"

switch name {
case .none:
    print("Hello")
case .some(let unwrappedName):
    print("Hello \(unwrappedName)")
}
// prints "Hello Taylor"

switch name {
case .none:
    print("Hello")
case let unwrappedName?:
    print("Hello \(unwrappedName)")
}
// prints "Hello Taylor"

var firstName: String? = "Taylor"
var lastName: String?

switch (firstName, lastName) {
case let (firstName?, lastName?):
    print("Hello \(firstName) \(lastName)")
case let (firstName?, .none):
    print("Hello \(firstName)")
case let (.none, lastName?):
    print("Hello \(lastName)")
case (.none, .none):
    print("Hello")
}
//prints "Hello Taylor"



// Optional Chaining
struct Person {
    let name: String
    var age: Int
}

struct Dog {
    var name: String
    var owner: Person?

    func bark() {
        print("woof")
    }
}

var dog: Dog?
dog?.bark() // bark() is not executed because dog doesn't contain a value
dog?.name = "Aayla"
print(dog?.name) // nil

var dogName = dog?.name
print(dogName) // nil
print(type(of: dogName)) // Optional<String>

var dogOwnerAge = dog?.owner?.age
print(dogOwnerAge) // nil because dog doesn't contain a value
print(type(of: dogOwnerAge)) // Optional<Int>

dog = Dog(name: "Jango")
dogName = dog?.name
print(dogName) // Optional("Jango")
print(type(of: dogName)) // Optional<String>

dogOwnerAge = dog?.owner?.age
print(dogOwnerAge) // nil
print(type(of: dogOwnerAge)) // Optional<Int>

dog?.owner = Person(name: "Warren", age: 42)
dogOwnerAge = dog?.owner?.age
print(dogOwnerAge) // Optional(42)
print(type(of: dogOwnerAge)) // Optional<Int>

dog?.name = "Aayla"
print(dog?.name) // Aayla

dog?.bark() // woof

if dog?.bark() != nil {
    print("Good dog")
}
// Prints "woof"
// Prints "Good dog"

if (dog?.name = "Luna") != nil {
    print("Dog's name was set to \(dog?.name)")
}
// Prints "Dog's name was set to Optional("Luna")




// Nil-Coalescing Operator
var regularMenu = "Regular Menu"
var specialMenu: String?

var menu = specialMenu ?? regularMenu
print(menu) // Regular Menu

