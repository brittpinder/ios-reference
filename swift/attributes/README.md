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

### @discardableResult

When applied to a function that returns a value, `@discardableResult` supresses the compiler warning that arises when the returned value is not used.

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