import UIKit

class Counter {
    var daysLeft: Int

    lazy var displayString: () -> String = { [unowned self] in
        if self.daysLeft == 1 {
            return "There is 1 day left"
        } else {
            return "There are \(self.daysLeft) days left"
        }
    }

    init(daysLeft: Int) {
        self.daysLeft = daysLeft
    }

    deinit {
        print("Deallocating Counter")
    }
}

var counter: Counter? = Counter(daysLeft: 4)
counter = nil // Deallocating Counter
