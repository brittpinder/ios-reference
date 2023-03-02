import UIKit

func calculate(num1: Int, num2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(num1, num2)
}

func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

var result = calculate(num1: 3, num2: 6, operation: add)
print(result) // 9


var result1 = calculate(num1: 3, num2: 6, operation: {(a: Int, b: Int) -> Int in
    return a + b
})
print(result1) // 9



// Type Inference
calculate(num1: 3, num2: 6, operation: {(a: Int, b: Int) -> Int in
    return a + b
})

calculate(num1: 3, num2: 6, operation: { a, b in
    return a + b
})



// Implicit Return
calculate(num1: 3, num2: 6, operation: { a, b in
    a + b
})



// Shorthand Argument Names
calculate(num1: 3, num2: 6, operation: {
    $0 + $1
})

calculate(num1: 3, num2: 6, operation: { $0 + $1 })



// Trailing Closure Syntax
calculate(num1: 3, num2: 6) { $0 + $1 }


// Operator Methods
calculate(num1: 3, num2: 6, operation: + )






var names = ["Pam", "Dwight", "Angela", "Michael", "Jim"]

var sortedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 < s2
})

print(sortedNames) // ["Angela", "Dwight", "Jim", "Michael", "Pam"]


// Full closure syntax
names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 < s2
})

// Type inference
names.sorted(by: { s1, s2 in
    return s1 < s2
})

// Implicit return
names.sorted(by: { s1, s2 in
    s1 < s2
})

// Shorthand argument names
names.sorted(by: { $0 < $1 })

// Trailing closure
names.sorted() { $0 < $1 }

// Operator Method
names.sorted(by: <)
