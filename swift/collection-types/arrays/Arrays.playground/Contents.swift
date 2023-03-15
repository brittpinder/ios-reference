import UIKit

// Full syntax
var numbers1: Array<Int> = Array<Int>()

// Full syntax with implicitly derived type
var numbers2 = Array<Int>()

// Shorthand syntax
var numbers3: [Int] = []

// Shorthand syntax with implicitly derived type
var numbers4 = [Int]()


var colors = ["Red", "Green", "Blue"]


var values = Array(repeating: 2.0, count: 4)
print(values) // [2.0, 2.0, 2.0, 2.0]



var grades = [85, 76]
var scores = [99, 85, 78]

var allGrades = grades + scores
print(allGrades) // [85, 76, 99, 85, 78]



var friends = ["Chandler", "Joey"]
print(friends.count) // 2
print(friends.isEmpty) // false

var someone = friends[0]
print(someone) // Chandler



if let firstFriend = friends.first, let lastFriend = friends.last {
    print(firstFriend) // Chandler
    print(lastFriend) // Joey
}


friends.append("Ross")
print(friends) // ["Chandler", "Joey", "Ross"]


friends += ["Phoebe", "Rachel"]
print(friends) // ["Chandler", "Joey", "Ross", "Phoebe", "Rachel"]


friends.insert("Monica", at: 3)
print(friends) // ["Chandler", "Joey", "Ross", "Monica", "Phoebe", "Rachel"]

friends.insert(contentsOf: ["Gunther", "Janice"], at: 3)
print(friends) // ["Chandler", "Joey", "Ross", "Gunther", "Janice", "Monica", "Phoebe", "Rachel"]

friends[4] = "Richard"
print(friends) // ["Chandler", "Joey", "Ross", "Gunther", "Richard", "Monica", "Phoebe", "Rachel"]

friends[2...4] = ["Mike", "Carol"]
print(friends) // ["Chandler", "Joey", "Mike", "Carol", "Monica", "Phoebe", "Rachel"]

friends.removeFirst()
print(friends) // ["Joey", "Mike", "Carol", "Monica", "Phoebe", "Rachel"]

friends.removeLast()
print(friends) // ["Joey", "Mike", "Carol", "Monica", "Phoebe"]


let removedFriend = friends.remove(at: 2)
print(removedFriend) // Carol
print(friends) // ["Joey", "Mike", "Monica", "Phoebe"]

friends[1...2] = []
print(friends) // ["Joey", "Phoebe"]


friends.removeAll(keepingCapacity: true)
print(friends) // []
print(friends.capacity) // 8

friends = []
print(friends.capacity) // 0



let groceryList = ["Broccoli", "Carrots", "Potatoes"]

for item in groceryList {
    print(item)
}
// Broccoli
// Carrots
// Potatoes

groceryList.forEach { item in
    print(item)
}
// Broccoli
// Carrots
// Potatoes

for (index, value) in groceryList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Broccoli
// Item 2: Carrots
// Item 3: Potatoes


for i in 0..<groceryList.count {
    print("Item \(i + 1): \(groceryList[i])")
}
// Item 1: Broccoli
// Item 2: Carrots
// Item 3: Potatoes



let nums = [3, 6, 9, 2, 10, 9, 12]

let containsFour = nums.contains(4)
print(containsFour) // false

let containsValuesGreaterThanTen = nums.contains(where: {$0 > 10})
print(containsValuesGreaterThanTen) // true

let allValuesAreEven = nums.allSatisfy({$0 % 2 == 0})
print(allValuesAreEven) // false


let firstEvenNumber = nums.first(where: {$0 % 2 == 0})
print(firstEvenNumber) // Optional(6)

let lastNumberLessThanSeven = nums.last(where: {$0 < 7})
print(lastNumberLessThanSeven) // Optional(2)

let firstNumberGreaterThanTwenty = nums.first(where: {$0 > 20})
print(firstNumberGreaterThanTwenty) // nil



let firstIndexOfNine = nums.firstIndex(of: 9)
print(firstIndexOfNine) // Optional(2)

let lastIndexOfNine = nums.lastIndex(of: 9)
print(lastIndexOfNine) // Optional(5)

let firstIndexOfZero = nums.firstIndex(of: 0)
print(firstIndexOfZero) // nil




var letters = ["A", "B", "C"]
var lettersCopy = letters

letters[0] = "K"
lettersCopy[1] = "Z"

print(letters) // ["K", "B", "C"]
print(lettersCopy) // ["A", "Z", "C"]


class Person {
    var name: String

    init(_ name: String) {
        self.name = name
    }
}

var people = [Person("Michael"), Person("Jim"), Person("Pam")]
var peopleCopy = people

people[0].name = "Dwight"
print(peopleCopy[0].name) // Dwight


people[0] = Person("Angela")
print(people[0].name) // Angela
print(peopleCopy[0].name) // Dwight
