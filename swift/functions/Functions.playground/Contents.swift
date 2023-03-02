import UIKit

func sayHello() {
    print("Hello World") // Hello World
}

func greet(person: String) -> String {
    return "Hello, \(person)!"
}

print(greet(person: "Anna")) // Hello, Anna!



func getCenter(x: Float, y: Float, width: Float, height: Float) -> (x: Float, y: Float) {
    let centerX = x + width / 2
    let centerY = y + height / 2
    return (centerX, centerY)
}

let center = getCenter(x: 0, y: 0, width: 10, height: 5)
print(center.x) // 5.0
print(center.y) // 2.5


func getBounds(array: [Int]) -> (min: Int, max: Int)? {
    if let min = array.min(), let max = array.max() {
        return (min, max)
    }
    return nil
}

if let bounds = getBounds(array: [2, 7, 4, 9, -3, 6]) {
    print(bounds) // (min: -3, max: 9)
}


//func addNumbers(num1: Int, num2: Int) -> Int {
//    return num1 + num2
//}

func addNumbers(num1: Int, num2: Int) -> Int {
    num1 + num2
}

print(addNumbers(num1: 4, num2: 3)) // 8






func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(person: "Brittany", from: "Halifax")) // Hello Brittany! Glad you could visit from Halifax.




func calculateAverage(_ numbers: [Float]) -> Float {
    return numbers.reduce(0, +) / Float(numbers.count)
}

let average = calculateAverage([2, 6, 10])



func calculateAverage(_ numbers: Float...) -> Float {
    return numbers.reduce(0, +) / Float(numbers.count)
}

calculateAverage(2, 6, 10)


func createButton(width: CGFloat, height: CGFloat, color: UIColor = .blue) -> UIButton {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: height))
    button.backgroundColor = color
    return button
}

let button = createButton(width: 30, height: 20)
let redButton = createButton(width: 40, height: 40, color: .red)





func swapValues(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var a = 2
var b = 4

swapValues(&a, &b)
print(a) // 4
print(b) // 2

