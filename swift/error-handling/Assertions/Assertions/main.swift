//
//  main.swift
//  Assertions
//
//  Created by Brittany Pinder on 2023-02-23.
//

import Foundation

func testAssert() {

    struct Person {
        var age: Int

        init(age: Int) {
            assert(age >= 0, "A person's age can't be less than zero.")
            print("Hello World") // If the assert fails, this line is executed only in a Release build

            self.age = max(0, age)
        }
    }

    let person = Person(age: -3)
}

func testAssertionFailure() {

    func rollDie() {
        let number = Int.random(in: 1...4) // Intentional bug to highlight the assertionFailure. 4 should be a 3

        switch number {
        case 1:
            print("You rolled a one!")
        case 2:
            print("You rolled a two!")
        case 3:
            print("You rolled a three!")
        default:
            assertionFailure("Rolling a 3-sided die shouldn't have any other results.")
            print("Hello World") // If the default case is triggered, this line is executed only in a Release build
        }
    }

    rollDie()
}

func testPrecondition() {

    func removeAtIndex(array: inout [Int], index: Int) {
        precondition(index >= 0 && index < array.count, "Index is out of bounds!")
        print("Hello World") // If the precondition fails, this line is executed only in Release mode if safety checks are disabled

        array.remove(at: index)
    }

    var numbers = [1, 6, 13, 5, 22]

    removeAtIndex(array: &numbers, index: -1)
}

func testPreconditionFailure() {

    enum Suit {
        case heart
        case diamond
        case spade
        case club
    }

    func getSuit(name: String) -> Suit {
        switch name {
        case "Heart":
            return Suit.heart
        case "Diamond":
            return Suit.diamond
        case "Spade":
            return Suit.spade
        case "Club":
            return Suit.club
        default:
            preconditionFailure("Unrecognized suit name!")
            print("Hello World") // If the default case is hit, this line will never be executed
        }
    }

    print(getSuit(name: "Clover"))
}

func testFatalError() {
    guard let url = Bundle.main.url(forResource: "input", withExtension: "json") else {
        fatalError("Failed to locate input.json in bundle.")
        print("Hello World") // If the guard block is triggered, this line will never be executed
    }

    print(url)

    // Similar example: Forceunwrapping a nil optional will cause a fatalError
    //let url = Bundle.main.url(forResource: "input", withExtension: "json")!
}

//testAssert()
//testAssertionFailure()
//testPrecondition()
testPreconditionFailure()
//testFatalError()

