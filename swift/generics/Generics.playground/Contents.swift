import UIKit

func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var num1 = 34
var num2 = 16

swapValues(&num1, &num2)

print(num1) // 16
print(num2) // 34


var name1 = "Bob"
var name2 = "Fred"

swapValues(&name1, &name2)

print(name1) // Fred
print(name2) // Bob

// ---------------------------------------

struct Stack<Element> {
    var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var numbers = Stack<Int>()
numbers.push(5)
numbers.push(8)
numbers.push(3)
numbers.pop()

print(numbers) // Stack<Int>(items: [5, 8])

// ---------------------------------------

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let scores = [45, 88, 76, 92, 100]
let index = findIndex(of: 92, in: scores)
print(index) // Optional(3)

let names = ["Pam", "Jim", "Dwight", "Angela"]
let nameIndex = findIndex(of: "Jim", in: names)
print(nameIndex) // Optional(1)
