# [Attributes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/)

Attributes provide additional information about a declaration or a type and are specified with the @ symbol followed by the attribute's name and any arguments that the attribute accepts:

```swift
@<#attribute name#>
@<#attribute name#>(<#attribute arguments#>)
```
<br/>

## Declaration Attributes

Attributes applied to declarations such as functions, structs, enums etc, are called "declaration attributes".

<br/>

### [@discardableResult](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/#discardableResult)

When applied to a function that returns a value, `@discardableResult` suppresses the compiler warning that arises when the returned value is not used.

For example, the following function removes and returns the odd values from an array of integers.

```swift
func removeOdds(_ numbers: inout [Int]) -> [Int] {
    let odds = numbers.filter { $0 % 2 == 1 }
    numbers = numbers.filter { $0 % 2 == 0 }
    return odds
}
```

If we weren't interested in the odd values and just want to remove them and be left with an array of even numbers, the compiler would complain about the unused result of the function call:

```swift
var values = [4, 3, 2, 8, 9]
removeOdds(&values) // Warning: Result of call to 'removeOdds' is unused
```

One way of removing the warning is to assign the result of the function call to an underscore:

```swift
var values = [4, 3, 2, 8, 9]
let _ = removeOdds(&values)
```

But instead we can simply add the `@discardableResult` attribute to the function, telling the compiler not to complain if the result is unused:

```swift
@discardableResult
func removeOdds(_ numbers: inout [Int]) -> [Int] {
    let odds = numbers.filter { $0 % 2 == 1 }
    numbers = numbers.filter { $0 % 2 == 0 }
    return odds
}

var values = [4, 3, 2, 8, 9]
removeOdds(&values)
```

<br/>

## [Type Attributes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/#Type-Attributes)

Attributes applied to types, such as function parameters, are called "type attributes".

<br/>

### [@escaping](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/#escaping)

This attribute is applied to a function's parameter type to indicate that the parameter's value can leave the scope of the function and be stored for later execution (ie. the value is allowed to outlive the lifetime of the function call).

For example, below we have a function with a non-escaping closure:

```swift
func doSomething(using closure: () -> Void) {
    closure()
}
```

The closure is executed immediately within the `doSomething` function and has no chance of outliving the function call. However, if we change the behaviour of the function, allowing the closure to be called asynchronously, we would get an error:

```swift
func doSomethingAsynchronously(using closure: () -> Void) {
    DispatchQueue.main.async { // Error: Escaping closure captures non-escaping parameter 'closure'
        closure()
    }
}
```

To resolve this error, the `@escaping` attribute needs to be applied to the closure parameter, telling the compiler and reminding the user that they are dealing with a closure that will outlive the scope of the function it is being passed to.

```swift
func doSomethingAsynchronously(using closure: @escaping () -> Void) {
    DispatchQueue.main.async {
        closure()
    }
}
```

Another way that closures can escape is by being stored in a variable that's defined outside the function. Here we have to mark the `completionHandler` parameter with `@escaping` because it doesn't get executed until after the function completes.

```swift
var completionHandlers = [() -> Void]()

func storeCompletionHandler(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
```

See also, [Escaping Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/#Escaping-Closures)