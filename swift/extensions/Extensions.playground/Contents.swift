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



