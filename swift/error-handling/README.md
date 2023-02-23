# [Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)

## Representing and Throwing Errors

In Swift, errors are represented by values of types that conform to the `Error` protocol. For example, here is how you could represent the error conditions when creating a username:

```swift
enum UsernameError: Error {
    case tooShort
    case tooLong
    case invalidCharacter(character: Character)
}
```

Throwing an error lets you indicate that something unexpected happened and the normal flow of execution can't continue. For example, the following code throws an error to indicate that a username is too short:

```swift
throw UsernameError.tooShort
```

## Handling Errors

When an error is thrown, some surrounding piece of code must be responsible for handling the error - for example, by correcting the problem, trying an alternative approach, or informing the user of the failure. There are four ways of handling errors in Swift:

1. [Propogating Errors Using Throwing Functions](#propogating-errors-using-throwing-functions)
2. [Handling Errors Using Do-Catch](#handling-errors-using-do-catch)
3. [Converting Errors to Optional Values](#converting-errors-to-optional-values)
4. [Disabling Error Propagation](#disabling-error-propogation)

### Propogating Errors Using Throwing Functions

Any piece of code that has the possibility of throwing an error, must be wrapped in a *throwing function*. A throwing function is marked with the `throws` keyword:

```swift
func canThrowErrors() throws -> String

func cannotThrowErrors() -> String
```
A throwing function propogates errors that are thrown inside of it to the scope from which it is called. In the below example, we have a struct `User` which has an `init` method that can throw if the provided name doesn't meet certain requirements.

```swift
struct User {
    let name: String

    init(name: String) throws {
        guard name.count >= 5 else {
            throw UsernameError.tooShort
        }

        guard name.count <= 12 else {
            throw UsernameError.tooLong
        }

        for char in name {
            guard char.isLetter else {
                throw UsernameError.invalidCharacter(character: char)
            }
        }

        self.name = name
    }
}
```
If an error is encountered, the init function will exit and propogate that error to the scope in which the init function was called. That scope can either propogate the error further up the chain or handle it using one of the three remaining methods described below.


### Handling Errors Using Do-Catch

One common way of handling errors is by using a `do-catch` block because it allows you to handle the various error types differently. If no error occurs, everything in the `do` block of code will be executed. Otherwise, the error will be handled by one of the `catch` blocks.

```swift
func createUser(name: String) -> User? {
    do {
        let user = try User(name: name)
        print("Created user with name: \(user.name)")
        return user
    } catch UsernameError.tooShort {
        print("Error: Username is too short!")
    } catch UsernameError.tooLong {
        print("Error: Username is too long!")
    } catch UsernameError.invalidCharacter(let character) {
        print("Error: Please remove invalid character \(character) from username")
    } catch {
        print("Error creating user: \(error)")
    }
    return nil
}

createUser(name: "abc") // Error: Username is too short!
createUser(name: "dwightschrute") // Error: Username is too long!
createUser(name: "pam-beasley") // Error: Please remove invalid character - from username
createUser(name: "jimhalpert") // Created user with name: jimhalpert
```
Notice in the above example that the expression that can throw is preceded by the keyword `try`. This is a requirement - you must put `try` before any function call that can throw. There are two alternatives: `try?` and `try!` which are explained later on.

> Note: `catch` clauses don't have to handle every possible error that the code in the `do` clause can throw. If none of the catch clauses handle the error, the error propogates to the surrounding scope. However, the propogated error must be handled by *some* surrounding scope. If the error propogates to the top-level scope without being handled, you'll get a runtime error.

You can use [patterns](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/patterns/) with `do-catch` blocks to handle errors in many different ways including handling more than one error in one catch block, appending a condition using the `where` keyword, or simply check if the error is of a certain type:

```swift
func createUser1(name: String) throws -> User? {
    do {
        let user = try User(name: name)
        return user
    } catch UsernameError.tooShort, UsernameError.tooLong {
        print("Error: username length is either too short or too long!")
    } catch UsernameError.invalidCharacter(let character) where character.isNumber {
        print("Error: username cannot contain a number!")
    } catch is UsernameError {
        print("Error: Couldn't create username!")
    }
    return nil
}

do {
    try createUser1(name: "janice")
} catch {
    print("Unexpected non-user-name-related error occurred: \(error)")
}
```

### Converting Errors to Optional Values

Using `try?` allows you to handle all errors in the same way by converting the result of the throwing expression to an optional.

```swift
enum MathError: Error {
    case divisionByZero
}

func divide(dividend: Int, divisor: Int) throws -> Int {
    guard divisor != 0 else {
        throw MathError.divisionByZero
    }
    return dividend / divisor
}

let result1 = try? divide(dividend: 6, divisor: 3)
print(result1) // Optional(2)

let result2 = try? divide(dividend: 8, divisor: 0)
print(result2) // nil
```
In the above example, the first call to `divide` is successful, but because the `try?` keyword was used, the result is converted to an `Optional<Int>`. The second call to `divide` throws an error but it is handled by returning `nil`.

It is very common to use `if let` syntax when using `try?` to handle an error:

```swift
if let result = try? divide(dividend: 6, divisor: 3) {
    print(result)
} else {
    print("Division Error!")
}
// Prints: 2

if let result = try? divide(dividend: 8, divisor: 0) {
    print(result)
} else {
    print("Division Error!")
}
// Prints: Division Error!
```

### Disabling Error Propogation

If you are 100% certain that a throwing function won't throw an error at runtime, you can write `try!` before the expression to disable error propogation and wrap the call in a runtime assertion that no error will be thrown.

```swift
let result = try! divide(dividend: 16, divisor: 4)
print(result) // 4
```
However, if your assumptions are wrong and an error is actually thrown, you will get a runtime error.

## How to decide which `try` variation to use

Use `try` when you want to handle any errors either through propogation or a `do-catch` block.

```swift
do {
    let fileContents = try String(contentsOfFile: "input.txt")
    print(fileContents)
} catch {
    print(error.localizedDescription)
}
```

Use `try?` when you don't care about the specific error and are more interested in success or failure.

```swift
if let fileContents = try? String(contentsOfFile: "input.txt") {
    print(fileContents)
} else {
    print("Unable to read file")
}
```

Use `try!` when you are certain that the throwing expression will not throw an error and you don't want to bloat your code with error checking.

```swift
let fileContents = try! String(contentsOfFile: "input.txt")
print(fileContents)
```

<br/>

## Links
* [Apple Documention on Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
* [StackOverflow explanation of try variations](https://stackoverflow.com/questions/32390611/try-try-try-what-s-the-difference-and-when-to-use-each)