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

// ---------------------------------------

protocol Artist {
    associatedtype Art
    func create(art: Art) -> Art
}

struct Song {
    let name: String
    let key: String
    let length: Double
}

struct Musician: Artist {
    func create(art: Song) -> Song {
        return Song(name: "Prelude", key: "A flat major", length: 3.5)
    }
}

struct Painting {
    let size: (width: Double, height: Double)
    let value: Double
}

struct Painter: Artist {
    func create(art: Painting) -> Painting {
        return Painting(size: (width: 8.5, height: 11), value: 150)
    }
}

// ---------------------------------------

protocol Store {
    associatedtype Item
    var items: [Item] { get }
    mutating func addItem(_ item: Item)
}

struct Food {
    var name: String
    var calories: Int
}

struct Market: Store {
    var items = [Food]()

    mutating func addItem(_ item: Food) {
        items.append(item)
    }
}

func getHighestCalorieItem<S: Store>(from store: S) -> Food? where S.Item == Food {
    return store.items.max(by: { $1.calories > $0.calories })
}

var market = Market()
market.addItem(Food(name: "Apple", calories: 52))
market.addItem(Food(name: "Banana", calories: 110))
market.addItem(Food(name: "Lemon", calories: 17))

print(getHighestCalorieItem(from: market)?.name) // Optional("Banana")

struct Book {
    var name: String
    var pages: Int
}

struct Bookstore: Store {
    var items = [Book]()

    mutating func addItem(_ item: Book) {
        items.append(item)
    }
}

//getHighestCalorieItem(from: Bookstore()) // Error: Global function 'getHighestCalorieItem(from:)' requires the types 'Book' and 'Food' be equivalent

// ---------------------------------------
