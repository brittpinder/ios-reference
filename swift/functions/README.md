# Functions

As in other programming languages, functions are self-contained chunks of code that perform a specific task.

In Swift, functions are defined using the `func` keyword:

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

## Later

* Every function in Swift has a type, consisting of the function's parameter types and return type.
* Using a function's type, you can pass functions as parameters to other functions and to return functions from functions. Functions can also be written within other functions to encapsulate useful functionality within a nested function scope