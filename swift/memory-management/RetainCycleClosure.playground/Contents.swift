import UIKit

class Ordinal {
    let number: Int

//    lazy var getDisplayString: () -> String = { [weak self] in
//        guard let self else {
//            return ""
//        }
//
//        let lastDigit = self.number % 10
//        var suffix = "th"
//
//        if lastDigit == 1 && self.number != 11 {
//            suffix = "st"
//        } else if lastDigit == 2 && self.number != 12 {
//            suffix = "nd"
//        } else if lastDigit == 3 && self.number != 13 {
//            suffix = "rd"
//        }
//
//        return "\(self.number)\(suffix)"
//    }

    lazy var getDisplayString: () -> String = { [unowned self] in
        let lastDigit = self.number % 10
        var suffix = "th"

        if lastDigit == 1 && self.number != 11 {
            suffix = "st"
        } else if lastDigit == 2 && self.number != 12 {
            suffix = "nd"
        } else if lastDigit == 3 && self.number != 13 {
            suffix = "rd"
        }

        return "\(self.number)\(suffix)"
    }

    init(_ number: Int) {
        self.number = number
    }

    deinit {
        print("Deallocating Ordinal")
    }
}

var ordinal: Ordinal? = Ordinal(4)

print(ordinal?.getDisplayString())
// Optional("4th")

ordinal = nil
// Deallocating Ordinal
