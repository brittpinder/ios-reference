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

let allValuesAreLessThanTwenty = nums.allSatisfy({$0 < 20})
print(allValuesAreLessThanTwenty) // true



let marineAnimals: Set = ["Shark", "Whale", "Dolphin", "Crab"]
let mammals: Set = ["Cow", "Whale", "Lion", "Dolphin", "Cheetah"]
let bigCats: Set = ["Lion", "Cheetah"]
let africanPredators: Set = ["Cheetah", "Lion"]


// Get all marine animals that are also mammals
let intersection = marineAnimals.intersection(mammals)
print(intersection) // ["Dolphin", "Whale"]

// Get all animals that are not marine and mammal
let symmetricDifference = marineAnimals.symmetricDifference(mammals)
print(symmetricDifference) // ["Cheetah", "Crab", "Shark", "Lion", "Cow"]

// Get all animals
let union = marineAnimals.union(mammals)
print(union) // ["Crab", "Whale", "Dolphin", "Cow", "Lion", "Cheetah", "Shark"]

// Get all marine animals that are not mammals
let subtracting = marineAnimals.subtracting(mammals)
print(subtracting) // ["Shark", "Crab"]

// Get all mammals that are not marine animals
let subtracting1 = mammals.subtracting(marineAnimals)
print(subtracting1) // ["Cheetah", "Lion", "Cow"]



print(bigCats.isSubset(of: mammals)) // true
print(bigCats.isSubset(of: africanPredators)) // true
print(bigCats.isSubset(of: marineAnimals)) // false


print(mammals.isSuperset(of: bigCats)) // true
print(africanPredators.isSuperset(of: bigCats)) // true
print(marineAnimals.isSubset(of: bigCats)) // false


print(bigCats.isStrictSubset(of: mammals)) // true
print(bigCats.isStrictSubset(of: africanPredators)) // false


print(mammals.isStrictSuperset(of: bigCats)) // true
print(africanPredators.isStrictSuperset(of: bigCats)) // false


print(bigCats.isDisjoint(with: marineAnimals)) // true
print(bigCats.isDisjoint(with: mammals)) // false


print(bigCats == africanPredators) // true
print(mammals == marineAnimals) // false



var values: Set = [1, 2, 3]
var moreValues: Set = [4, 5, 6]

values.formUnion(moreValues)
print(values) // [6, 3, 5, 4, 2, 1]
