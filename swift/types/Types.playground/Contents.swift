import UIKit

let httpError = (404, "Not Found")

let (code, message) = httpError
print("The code is \(code)") // The code is 404
print("The message is \(message)") // The message is Not Found

print("The code is \(httpError.0)")  // The code is 404
print("The message is \(httpError.1)")  // The message is Not Found

let httpStatus = (statusCode: 200, description: "OK")
print("The status code is \(httpStatus.statusCode)") // The status code is 200
print("The description is \(httpStatus.description)") // The description is OK

// ----------------------------------------

struct Book {
    let name: String
}

class Song {
    let name: String

    init(name: String) {
        self.name = name
    }
}

let age = 25
let result = true
let printHello = { print("Hello") }
let book = Book(name: "Harry Potter")
let song = Song(name: "Shake It Off")
let button = UIButton()

let things: [Any] = [age, result, printHello, book, song, button]

let objects: [AnyObject] = [song, button]

let nsObjects: [NSObject] = [button, NSNumber(value: 42), NSString(string: "hello world")]

// ----------------------------------------

protocol MyProtocol: AnyObject {}

class MyClass: MyProtocol {}

//struct MyStruct: MyProtocol {} // Error: Non-class type 'MyStruct' cannot conform to class protocol 'MyProtocol'

// ----------------------------------------

//func getRandomNumber() -> some Numeric {
//    return Int.random(in: 1...10)
//}

//func getRandomNumber() -> some Numeric {
//    return Double.random(in: 2.5...5.0)
//}

//func getRandomNumber() -> some Numeric { // Error: Function declares an opaque return type 'some Numeric', but the return statements in its body do not have matching underlying types
//    if Bool.random() {
//        return Int.random(in: 1...10)
//    } else {
//        return Double.random(in: 2.5...5.0)
//    }
//}

func getRandomNumber() -> any Numeric {
    if Bool.random() {
        return Int.random(in: 1...10)
    } else {
        return Double.random(in: 2.5...5.0)
    }
}

print(getRandomNumber())

// ----------------------------------------

//protocol Pet {
//    var name: String { get set }
//}
//
//struct Dog: Pet {
//    var name: String
//}
//
//struct Cat: Pet {
//    var name: String
//}
//
//func adoptPet(petName: String) -> Pet {
//    return Cat(name: petName)
//}
//
//let myPet = adoptPet(petName: "Sprinkles")

protocol Pet {
    var name: String { get set }
    associatedtype Food
    func feed(_ food: Food)
}

struct Kibble {}

struct Dog: Pet {
    var name: String
    func feed(_ food: Kibble) {}
}

struct Tuna {}

struct Cat: Pet {
    var name: String
    func feed(_ food: Tuna) {}
}

func adoptPet(petName: String) -> some Pet {
    return Cat(name: petName)
}

//func adoptPet(petName: String) -> some Pet {
//    if petName.isEmpty {
//        return Cat(name: "Meredith")
//    } else {
//        return Cat(name: petName)
//    }
//}

//func adoptPet(petName: String) -> any Pet {
//    if Bool.random() {
//        return Cat(name: petName)
//    } else {
//        return Dog(name: petName)
//    }
//}
//
//let myPet = adoptPet(petName: "Sprinkles")
//print(type(of: myPet))
