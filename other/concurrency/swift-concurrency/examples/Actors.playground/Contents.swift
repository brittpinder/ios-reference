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
//actor BankAccount {
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
//            await account.withdraw(50)
//        }
//
//        group.addTask {
//            await account.withdraw(75)
//        }
//    }
//    await print(account.balance)
//}

// nonisolated
actor BankAccount {
    let id = UUID()
    private(set) var balance: Double = 0.0

    init(balance: Double) {
        self.balance = balance
    }

    nonisolated func printDetails() {
        print("ID: \(id)")
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

let account = BankAccount(balance: 100)
account.printDetails()

// isolated
class BankTeller {
    func withdraw(_ amount: Double, from account: isolated BankAccount) async -> Bool {
        if account.withdraw(amount) {
            return true
        }
        return false
    }

    func transfer(_ amount: Double, from account1: isolated BankAccount, to account2: BankAccount) async -> Bool {
        if account1.withdraw(amount) {
            await account2.deposit(amount)
            return true
        }

        return false
    }
}

Task {
    let teller = BankTeller()
    let myAccount = BankAccount(balance: 100)
    await teller.withdraw(50, from: myAccount)
    print(await myAccount.balance)

    let account1 = BankAccount(balance: 100)
    let account2 = BankAccount(balance: 100)
    await teller.transfer(30, from: account1, to: account2)
    await print(account1.balance)
    await print(account2.balance)
}
