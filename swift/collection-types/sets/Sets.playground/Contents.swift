import UIKit

// Explicit Type
var numbers: Set<Int> = Set<Int>()
var numbers1: Set<Int> = []

// Implicitly derived type
var numbers2 = Set<Int>()

// Using array literal
var numbers3: Set<Int> = [4, 6, 8, 2]
var numbers4: Set = [4, 6, 8, 2]


var fruits: Set = ["apple", "banana", "pear"]
print(fruits.count) // 3
print(fruits.isEmpty) // false
print(fruits) // ["pear", "banana", "apple"]

fruits.insert("orange")
print(fruits) // ["pear", "banana", "orange", "apple"]

let result = fruits.insert("banana")
print(result.inserted) // false
print(fruits) // ["pear", "banana", "orange", "apple"]

fruits.remove("pear")
print(fruits) // ["apple", "banana", "orange"]

let removedElement = fruits.remove("pineapple")
print(removedElement) // nil
print(fruits) // ["apple", "banana", "orange"]


fruits.removeAll(keepingCapacity: true)
print(fruits) // []
print(fruits.capacity) // 6

fruits = []
print(fruits.capacity) // 0
