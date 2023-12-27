import UIKit

class Ordinal {
    let number: Int

    lazy var getDisplayString: () -> String = { [weak self] in
        guard let self else {
            return ""
        }

        let suffix = getSuffix(for: self.number)
        return "\(self.number)\(suffix)"
    }

//    lazy var getDisplayString: () -> String = { [unowned self] in
//        let suffix = getSuffix(for: self.number)
//        return "\(self.number)\(suffix)"
//    }

    init(_ number: Int) {
        self.number = number
        print("Allocating Ordinal")
    }

    deinit {
        print("Deallocating Ordinal")
    }

    private func getSuffix(for number: Int) -> String {
        let lastDigit = number % 10
        let lastTwoDigits = number % 100

        if lastDigit == 1 && lastTwoDigits != 11 {
            return "st"
        } else if lastDigit == 2 && lastTwoDigits != 12 {
            return "nd"
        } else if lastDigit == 3 && lastTwoDigits != 13 {
            return "rd"
        }

        return "th"
    }
}

var ordinal: Ordinal? = Ordinal(4) // Allocating Ordinal

print(ordinal?.getDisplayString()) // Optional("4th")

ordinal = nil // Deallocating Ordinal
