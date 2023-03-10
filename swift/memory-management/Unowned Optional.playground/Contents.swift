import UIKit

class Customer {
    let name: String
    var card: CreditCard?

    init(name: String) {
        self.name = name
    }

    deinit {
        self.card?.customer = nil
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned var customer: Customer?

    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }

    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var john: Customer? = Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)

john = nil
// Prints "John Appleseed is being deinitialized"
// Prints "Card #1234567890123456 is being deinitialized"


var bob: Customer? = Customer(name: "Bob")
var creditCard = CreditCard(number: 1234_5678_9012_3456, customer: bob!)

bob!.card = creditCard

bob = nil
print(creditCard.customer?.name)

