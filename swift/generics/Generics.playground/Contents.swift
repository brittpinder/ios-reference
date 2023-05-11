import UIKit

func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var num1 = 34
var num2 = 16

swapValues(&num1, &num2)

print(num1) // 16
print(num2) // 34


var name1 = "Bob"
var name2 = "Fred"

swapValues(&name1, &name2)

print(name1) // Fred
print(name2) // Bob
