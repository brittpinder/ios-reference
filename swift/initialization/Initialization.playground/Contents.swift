import UIKit

// Assigning a default value
class Farenheit {
    var temperature: Double = 32.0
}

// Setting initial value within initializer
class Farenheit1 {
    var temperature: Double

    init() {
        temperature = 32.0
    }
}


struct Celsius {
    var temperatureInCelsius: Double

    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }

    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }

    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let bodyTemperature = Celsius(37.0)
print(bodyTemperature.temperatureInCelsius) // 37.0

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWater.temperatureInCelsius) // 100.0

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temperatureInCelsius) // 0.0


class Dog {
    var name: String
    var toy: String?

    init(name: String) {
        self.name = name
        // No need to set toy because it is an optional
    }
}


class Person {
    let name: String

    init(name: String) {
        self.name = name
    }
}

var person = Person(name: "Bob")
//person.name = "Robert" // Error: Cannot assign to property: 'name' is a let constant


//class ShoppingListItem {
//    var name: String?
//    var quantity = 1
//    var purchased = false
//}
//var item = ShoppingListItem()

struct ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
var anotherItem = ShoppingListItem(name: "Carrot", quantity: 3, purchased: true)


var bread = ShoppingListItem(name: "Bread", purchased: true)
var juice = ShoppingListItem(name: "Juice", quantity: 2)
var unknown = ShoppingListItem(quantity: 4)
