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



var colors: Set = ["blue", "yellow", "green", "red"]

for color in colors {
    print(color)
}
// yellow
// red
// green
// blue

print("\n\n")

for color in colors.sorted() {
    print(color)
}
// blue
// green
// red
// yellow

print("\n\n")

colors.forEach { color in
    print(color)
}
// green
// blue
// yellow
// red

print("\n\n")

var nums: Set = [4, 3, 10, 15]

let containsFive = nums.contains(5)
print(containsFive) // false

let containsThree = nums.contains(3)
print(containsThree) // true

let containsOddNumbers = nums.contains(where: {$0 % 2 == 1})
print(containsOddNumbers) // true



let marineAnimals: Set = ["Fish", "Whale", "Dolphin", "Crab"]
let mammals: Set = ["Cow", "Whale", "Gorilla", "Dolphin"]


// Get all marine animals that are also mammals
let intersection = marineAnimals.intersection(mammals)
print(intersection) // ["Dolphin", "Whale"]

// Get all animals that are not marine and mammal
let symmetricDifference = marineAnimals.symmetricDifference(mammals)
print(symmetricDifference) // ["Cow", "Fish", "Gorilla", "Crab"]

// Get all animals
let union = marineAnimals.union(mammals)
print(union) // ["Whale", "Crab", "Gorilla", "Cow", "Dolphin", "Fish"]

// Get all marine animals that are not mammals
let subtracting = marineAnimals.subtracting(mammals)
print(subtracting) // ["Fish", "Crab"]

let subtracting1 = mammals.subtracting(marineAnimals)
print(subtracting1) // ["Cow", "Gorilla"]
