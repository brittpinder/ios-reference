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
let name: String? = "Taylor"

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

let firstName: String? = "Taylor"
let lastName: String? = nil

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
