//
//  main.swift
//  Attributes
//
//  Created by Brittany Pinder on 2023-05-25.
//

import Foundation

@discardableResult
func removeOdds(_ numbers: inout [Int]) -> [Int] {
    let odds = numbers.filter { $0 % 2 == 1 }
    numbers = numbers.filter { $0 % 2 == 0 }
    return odds
}

var values = [4, 3, 2, 8, 9]
removeOdds(&values)
