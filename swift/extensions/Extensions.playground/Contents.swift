import UIKit

struct Dog {
    var name: String
    var breed: String
}

extension Dog {
    func bark() {
        print("woof")
    }
}

let dog = Dog(name: "Jango", breed: "Husky")
dog.bark() // woof

//-----------------------------------------

extension Int {
    func isEven() -> Bool {
        self % 2 == 0
    }
}

print(2.isEven()) // true
print(3.isEven()) // false

//-----------------------------------------

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}

//stackView.addArrangedSubview(view1)
//stackView.addArrangedSubview(view2)
//stackView.addArrangedSubview(view3)
//
//stackView.addArrangedSubviews(view1, view2, view3)

//-----------------------------------------

extension Int {
    var squared: Int {
        self * self
    }
}

print(4.squared) // 16

//-----------------------------------------

struct Book {
    let title: String
    let pages: Int
    let readingHours: Double
}

extension Book {
    init(title: String, pages: Int) {
        self.title = title
        self.pages = pages
        self.readingHours = Double(pages) / 30.0
    }
}

let hp = Book(title: "Harry Potter", pages: 223)
print(hp.readingHours) // 7.43

let lotr = Book(title: "Lord of the Rings", pages: 1216, readingHours: 48)

//-----------------------------------------

struct Point {
    var x: Double
    var y: Double
}

class Square {
    let position: Point
    let center: Point
    let length: Double

    init(position: Point, length: Double) {
        self.position = position
        self.length = length
        self.center = Point(x: position.x + length / 2, y: position.y + length / 2)
    }
}

let square1 = Square(position: Point(x: 0.0, y: 0.0), length: 5.0)
print(square1.center) // Point(x: 2.5, y: 2.5)


extension Square {
    convenience init(center: Point, length: Double) {
        self.init(position: Point(x: center.x - length / 2, y: center.y - length / 2), length: length)
    }

//    init(center: Point, length: Double) { // Error
//        self.center = center
//        self.length = length
//        self.position = Point(x: center.x - length / 2, y: center.y - length / 2)
//    }
}

let square2 = Square(center: Point(x: 4.0, y: 4.0), length: 6.0)
print(square2.position) // Point(x: 1.0, y: 1.0)

//-----------------------------------------

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    mutating func trim() {
        self = self.trimmed()
    }
}

var phrase = "   Hello world   "
print(phrase.trimmed()) //Hello World

phrase.trim()
print(phrase) //Hello World

//-----------------------------------------

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}

var name: String? = ""
print(name.isNilOrEmpty) // true
