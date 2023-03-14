import UIKit

func swapValues(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var foo = 2

//swapValues(&foo, &foo)
// Error: Inout arguments are not allowed to alias each other
// Error: Overlapping accesses to 'foo', but modification requires exclusive access; consider copying to a local variable
