import UIKit

struct Dog {
    let name: String
}

class Cat {
    let name: String

    init(name: String) {
        self.name = name
    }
}

let age = 25
let result = true
let printHello = { print("Hello") }
let dog = Dog(name: "Jango")
let cat = Cat(name: "Sprinkles")
let button = UIButton()

let things: [Any] = [age, result, printHello, dog, cat, button]


let objects: [AnyObject] = [cat, button]

let nsObjects: [NSObject] = [button, NSNumber(value: 42), NSString(string: "hello world")]

// ----------------------------------------

protocol MyProtocol: AnyObject {}

class MyClass: MyProtocol {}

struct MyStruct: MyProtocol {} // Error: Non-class type 'MyStruct' cannot conform to class protocol 'MyProtocol'

