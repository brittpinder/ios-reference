import UIKit

// Data Race Example
//class BankAccount {
//    private(set) var balance: Double = 0.0
//
//    init(balance: Double) {
//        self.balance = balance
//    }
//
//    func deposit(_ amount: Double) {
//        balance += amount
//    }
//
//    @discardableResult
//    func withdraw(_ amount: Double) -> Bool {
//        if balance >= amount {
//            usleep(UInt32.random(in: 100_000...200_000))
//            balance -= amount
//            return true
//        }
//        return false
//    }
//}
//
//Task {
//    let account = BankAccount(balance: 100)
//
//    await withTaskGroup(of: Void.self) { group in
//        group.addTask {
//            account.withdraw(50)
//        }
//
//        group.addTask {
//            account.withdraw(75)
//        }
//    }
//    print(account.balance)
//}


// Data Race Prevented by Actor
actor BankAccount {
    private(set) var balance: Double = 0.0

    init(balance: Double) {
        self.balance = balance
    }

    func deposit(_ amount: Double) {
        balance += amount
    }

    @discardableResult
    func withdraw(_ amount: Double) -> Bool {
        if balance >= amount {
            usleep(UInt32.random(in: 100_000...200_000))
            balance -= amount
            return true
        }
        return false
    }
}

Task {
    let account = BankAccount(balance: 100)

    await withTaskGroup(of: Void.self) { group in
        group.addTask {
            await account.withdraw(50)
        }

        group.addTask {
            await account.withdraw(75)
        }
    }
    await print(account.balance)
}

