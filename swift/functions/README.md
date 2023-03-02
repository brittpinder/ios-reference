# Functions

Functions are self-contained chunks of code that perform a specific task. In Swift, functions are defined using the `func` keyword:

```swift
func sayHello() {
    print("Hello World") // Hello World
}
```

The following example shows how to define a parameter and a return value for a function.

```swift
func greet(person: String) -> String {
    return "Hello, \(person)!"
}

print(greet(person: "Anna")) // Hello, Anna!
```

<br/>

## Returning Values

### Functions with Multiple Return Values

You can return a tuple type in order to return multiple values from a function. The function below returns the center position of a rectangle.

```swift
func getCenter(x: Float, y: Float, width: Float, height: Float) -> (x: Float, y: Float) {
    let centerX = x + width / 2
    let centerY = y + height / 2
    return (centerX, centerY)
}

let center = getCenter(x: 0, y: 0, width: 10, height: 5)
print(center.x) // 5.0
print(center.y) // 2.5
```
> Note that the tuple's members don't need to be named at the point that the tuple is returned from the function, because their names are already specified as part of the function's return type.

<br/>

Here is an example of returning an optional tuple:

```swift
func getBounds(array: [Int]) -> (min: Int, max: Int)? {
    if let min = array.min(), let max = array.max() {
        return (min, max)
    }
    return nil
}

if let bounds = getBounds(array: [2, 7, 4, 9, -3, 6]) {
    print(bounds) // (min: -3, max: 9)
}
```

<br/>

### Functions with an Implicit Return

If the entire body of a function is a single expression, the function will implicitly return that expression, which means that you can omit the `return` keyword. Both functions below have the same behaviour:

```swift
func addNumbers(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

func addNumbers(num1: Int, num2: Int) -> Int {
    num1 + num2
}
```

<br/>

## Argument Labels and Parameter Names

Each function parameter has both an *argument label* and a *parameter name*. The argument label is used *outside* the function when you are calling it. The parameter name is used *inside* the function during the function implementation.

```swift
func someFunction(argumentLabel parameterName: Int) {
    print(parameterName) // 5
}

someFunction(argumentLabel: 5)
```
The use of argument labels can allow a function to be called in an expressive, sentence-like manner, while still providing a function body that's readable and clear in intent. In the below example, `from` is the argument label and `hometown` is the parameter name.

```swift
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(person: "Brittany", from: "Halifax")) // Hello Brittany! Glad you could visit from Halifax.
```

> All parameters must have unique names. It’s possible for multiple parameters to have the same argument label, however unique argument labels help make your code more readable.

<br/>

### Omitting Argument Labels

If you don't specify an argument label, by default the parameter name will be the argument label. In the below example, no argument label is specified so it is defaulted to the parameter name of `numbers`:

```swift
func calculateAverage(numbers: [Float]) -> Float {
    return numbers.reduce(0, +) / Float(numbers.count)
}

let average = calculateAverage(numbers: [2, 6, 10])
```

However, if you want to omit the argument label completely, you can replace it with an underscore (`_`). When an argument label is omitted, you no longer need to include it when calling a function:

```swift
func calculateAverage(_ numbers: [Float]) -> Float {
    return numbers.reduce(0, +) / Float(numbers.count)
}

let average = calculateAverage([2, 6, 10])
```
<br/>

### Variadic Parameters

A *variadic parameter* accepts zero or more values of a specified type. Variadic parameters are indicated by inserting three period characters (`...`) after the parameter's type name. The values passed to a variadic parameter are made available within the function's body as an array of the appropriate type.

For example, the `calculateAverage` function from above could be rewritten like so:

```swift
func calculateAverage(_ numbers: Float...) -> Float {
    return numbers.reduce(0, +) / Float(numbers.count)
}

calculateAverage(2, 6, 10)
```

<br/>

### Default Parameter Values

Similar to other programming languages, it is possible to specify default parameter values. Any parameters that have a default value will need to appear last.

```swift
func createButton(width: CGFloat, height: CGFloat, color: UIColor = .blue) -> UIButton {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: height))
    button.backgroundColor = color
    return button
}

let button = createButton(width: 30, height: 20)
let redButton = createButton(width: 40, height: 40, color: .red)
```

<br/>

### In-Out Parameters

Function parameters are constants by default meaning that you cannot change their values within the body of the function. If you want a function to modify a parameter's value and you want those changes to persist after the function call has ended, define that parameter as an *in-out parameter* by placing the `inout` keyword right before the parameter's type. When passing an argument for an in-out parameter, you need to put an ampersand (`&`) directly before the variable's name.

The below example takes two in-out parameters and swaps their values:

```swift
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
```

In-out parameters are passed using a model known as *copy-in copy-out* or *call by value result*:

1. When the function is called, the value of the argument is copied
2. In the body of the function, the copy is modified
3. When the function returns, the copy's value is assigned to the original argument

When the argument is a value stored at a physical address in memory, an optimization is made whereby the same memory location is used both inside and outside the function body. This optimized behaviour is known as *call by reference*. However, you should write your code using the model given by copy-in copy-out, without depending on the call-by-reference optimization, so that it behaves correctly with or without the optimization.

<br/>

## Function Types

Every function in Swift has a type, consisting of the function's parameter types and return type. This allows functions to be passed as parameters to other functions or to be returned from other functions.

The two functions below, both have the same type of `(Int, Int) -> Int`. They both take two parameters of type `Int` and return a value of type `Int`.

```swift
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}
```
Here is an example of a function that has no parameters or return value. It has a type of `() -> Void`.

```swift
func printHelloWorld() {
    print("hello, world")
}
```
<br/>

### Using Function Types

You can use function types just like any other types in Swift. For example, you can define a variable with a certain function type and assign an appropriate function to that variable:

```swift
var mathFunction: (Int, Int) -> Int = add
print(mathFunction(2, 3)) // 5

mathFunction = multiply
print(mathFunction(2, 3)) // 6
```
Type inference also works when assigning function types to variables:

```swift
var anotherMathFunction = add
print(type(of: anotherMathFunction)) // (Int, Int) -> Int
```
<br/>

### Function Types as Parameter Types

Using a function type as a parameter type allows you to pass functions as arguments to other functions:

```swift
func calculate(_ a: Int, _ b: Int, _ operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

let result = calculate(4, 7, multiply)
print(result) // 28
```
<br/>

### Function Types as Return Types

You can use a function type as the return type of another function by writing a complete function type immediately after the return arrow of the returning function.

For example, suppose we had two more similar functions, `subtract` and `divide`. We could then write a function that returns a mathematical function depending on the operation symbol we provide:

```swift
func chooseCalculation(operation: String) -> (Int, Int) -> Int {
    switch operation {
    case "+":
        return add
    case "-":
        return subtract
    case "*":
        return multiply
    case "/":
        return divide
    default:
        // Obviously this case would need to be handled in a better way
        return add
    }
}

var calculation = chooseCalculation(operation: "-")
print(calculation(7, 2)) // 5

let calculationResult = chooseCalculation(operation: "/")(12, 3)
print(calculationResult) // 4
```

<br/>

## Nested Functions

All of the functions encountered so far have been defined at a global scope - they are *global functions*. Functions can also be written within other functions to encapsulate useful functionality within a nested function scope.

*Nested functions* are hidden from the outside by default and can only be called and used by their enclosing function. However, an enclosing function can return one of its nested functions to allow the nested function to be used in another scope.

For example, the `chooseCalculation` function from above could be rewritten like this:

```swift
func chooseCalculation(operation: String) -> (Int, Int) -> Int {
    func addition(_ a: Int, _ b: Int) -> Int {
        return a + b
    }

    func subtraction(_ a: Int, _ b: Int) -> Int {
        return a - b
    }

    func multiplication(_ a: Int, _ b: Int) -> Int {
        return a * b
    }

    func division(_ a: Int, _ b: Int) -> Int {
        return a / b
    }

    switch operation {
    case "+":
        return addition
    case "-":
        return subtraction
    case "*":
        return multiplication
    case "/":
        return division
    default:
        // Obviously this case would need to be handled in a better way
        return addition
    }
}

var mathOperation = chooseCalculation(operation: "+")
print(mathOperation(2, 7)) // 9

```

## Links

* [Apple Documentation on Functions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/)
* [Apple Documentation on In-Out Parameters](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations/#In-Out-Parameters)