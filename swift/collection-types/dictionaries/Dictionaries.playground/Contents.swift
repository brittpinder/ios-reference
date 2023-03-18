import UIKit

// Full syntax
var empty1: Dictionary<String, Int> = Dictionary<String, Int>()

// Full syntax with implicitly derived type
var empty2 = Dictionary<String, Int>()

// Shorthand syntax
var empty3: [String: Int] = [:]

// Shorthand syntax with implicitly derived type
var empty4 = [String: Int]()


var numbers: [Int: String] = [4: "Four", 7: "Seven", 9: "Nine"]

var numbers1 = [4: "Four", 7: "Seven", 9: "Nine"]


var airports = ["YYZ": "Toronto Pearson", "ARN": "Stockholm-Arlanda"]
print(airports.count) // 2
print(airports.isEmpty) // false

print(airports["YYZ"]) // Optional("Toronto Pearson")
print(airports["CDG"]) // nil

if let airportName = airports["YYZ"] {
    print(airportName)
}
// Toronto Pearson

airports["AKL"] = "Auckland"

print(airports) // ["ARN": "Stockholm-Arlanda", "YYZ": "Toronto Pearson", "AKL": "Auckland"]


airports["YYZ"] = "Toronto Pearson International"

let oldValue = airports.updateValue("Auckland Airport", forKey: "AKL")
print(oldValue) // Optional("Auckland")
print(airports["AKL"]) // Optional("Auckland Airport")


let previousValue = airports.updateValue("Skopje", forKey: "SKP")
print(previousValue) // nil
print(airports["SKP"]) // Skopje


airports["YYZ"] = nil
print(airports) // ["ARN": "Stockholm-Arlanda", "AKL": "Auckland Airport", "SKP": "Skopje"]

let removedValue = airports.removeValue(forKey: "ARN")
print(removedValue) // Optional("Stockholm-Arlanda")
print(airports) // ["SKP": "Skopje", "AKL": "Auckland Airport"]

let removed = airports.removeValue(forKey: "CDG")
print(removed) // nil
print(airports) // ["AKL": "Auckland Airport", "SKP": "Skopje"]

airports.removeAll(keepingCapacity: true)
print(airports) // [:]
print(airports.capacity) // 6

airports = [:]
print(airports) // [:]
print(airports.capacity) // 0
