import Foundation

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var myString = TrackedString()
myString.value = "Hello"
myString.value = "World"

print(myString.numberOfEdits) // 2
//myString.numberOfEdits = 5 // Compiler Error: Cannot assign to property: 'numberOfEdits' setter is inaccessible

