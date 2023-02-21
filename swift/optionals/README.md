# [Optionals](https://developer.apple.com/documentation/swift/optional)
An optional value represents either a wrapped value (an existing value) or the absence of a value (`nil`). Optional values are usually indicated by a trailing question mark (?) after the type, but they can also be expressed more explicitly using generic syntax:

```swift
let shortForm: Int? = Int("42")
let longForm: Optional<Int> = Int("42")
```
Here is an example of an optional that initially contains no value and later holds a value.

```swift
var optionalString: String?
print(optionalString) // nil
print(optionalString == nil) // true

optionalString = "Hello"
print(optionalString) // Optional("Hello")
print(optionalString == nil) // false
```
Notice in the above example, when `optionalString` has a value and we print it, it prints `Optional("Hello")` instead of `Hello`. In order to get the value that the optional is storing, we need to "unwrap" it. There are four options for unwrapping optionals:

1. Force Unwrapping
2. Optional Binding
3. Optional Chaining
4. Nil Coalescing Operator

## Force Unwrapping
Force unwrapping is performed by adding an exclamation point (!) after an optional.

```swift
var age: Int? = 65

print(age) // Optional(65)
print(age!) // 65
```

Force unwrapping an optional is the easiest method but also the most dangerous because if your optional doesn't contain a value, your app will crash.

```swift
var age: Int?

print(age) // nil
print(age!) // Fatal error: Unexpectedly found nil while unwrapping an Optional value
```


You should only force unwrap an optional if you are 100% sure that it contains a value (for example, if you explicitly check that the value is not `nil`)

```swift
if age != nil {
    print(age!) // 65
}
```


## Optional Binding

Optional binding will unwrap an optional only if it exists and store that unwrapped value in a temporary variable. This can be done using `if let`, `guard let` or `switch`.

### Optional Binding with `if let`
When using `if let` to unwrap an optional, the `if let` block of code is only executed if the unwrapped optional has a value. Additionally, the temporary variable assigned to the unwrapped value only exists within the `if let` block.

```swift
var optionalName: String? = "Taylor"

if let name = optionalName {
    print(name)
} else {
    print("name is nil")
}
// prints "Taylor"

print(name) // Cannot find 'name' in scope
```
In the above example, the value "Taylor" is assigned to `name` and the `if let` code block is executed. Notice when we try to print `name` afterwards, the compiler complains because that variable no longer exists.

If `optionalName` doesn't hold a value, the `else` case will be executed:

```swift
var optionalName: String?

if let name = optionalName {
    print(name)
} else {
    print("name is nil")
}
// prints "name is nil"
```
When using `if let` it isn't necessary to create a new variable. You can also just use the existing variable name of the optional you are unwrapping:

```swift
var optionalName: String? = "Taylor"

if let optionalName {
    print("optionalName has a value of \(optionalName)")
}
// prints "optionalName has a value of Taylor"
```

It is possible to chain multiple `if let` statements together. When doing so, the following block of code will only be executed if all unwrapped optionals contain values.

```swift
var email: String? = "123@abc.com"
var password: String?

if let email, let password {
    print("Email: \(email), Password: \(password)")
}
// Nothing is printed because password doesn't contain a value
```

### Optional Binding with `guard let`

A `guard let` statement attempts to unwrap an optional and if it doesn't contain a value, a mandatory `else` block of code is executed. This `else` block, must exit the scope (ex: by using `return` or `throw`).

In the below example, a `guard let` statement is used to exit the function early if `name` does not have a value.

```swift
func printGreeting(name: String?) {
    guard let safeName = name else {
        print("name does not have a value! Exiting function.")
        return
    }

    print("Hello \(safeName)")
}

printGreeting(name: nil) // name does not have a value! Exiting function.
printGreeting(name: "Gary") // Hello Gary
```
Notice in the above example that the temporary variable `safeName` exists outside the scope of the `guard let` statement. This is one of the main differences between `guard let` and `if let`.

`if let` should be used when the nil case is valid (ex: a text field being empty) whereas `guard let` should be used when the nil case represents some sort of error.

### Optional Binding with `switch`

Behind the scenes, an optional is simply an enum containing two cases: `none` and `some`:

```swift
enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
}
```

This means that you optionally bind by switching on the two enum values:

```swift
let name: String? = "Taylor"

switch name {
case .none:
    print("Hello")
case .some(let unwrappedName):
    print("Hello \(unwrappedName)")
}
// prints "Hello Taylor"
```
An alternative syntax would be to remove `.some` and add a question mark after the assigned variable name:

```swift
switch name {
case .none:
    print("Hello")
case let unwrappedName?:
    print("Hello \(unwrappedName)")
}
// prints "Hello Taylor"
```
Optional binding with a `switch` can be very useful when you need to control the flow based on more than one optional value:

```swift
let firstName: String? = "Taylor"
let lastName: String? = nil

switch (firstName, lastName) {
case let (firstName?, lastName?):
    print("Hello \(firstName) \(lastName)")
case let (firstName?, .none):
    print("Hello \(firstName)")
case let (.none, lastName?):
    print("Hello \(lastName)")
case (.none, .none):
    print("Hello")
}
//prints "Hello Taylor"
```

## Optional Chaining

## Nil Coalescing Operator

## Links
* [Swift Optionals Video Tutorial](https://www.youtube.com/watch?v=ZL8BFK8bVjk&ab_channel=SeanAllen)
* [Optional Binding with Switch](https://sarunw.com/posts/optional-binding-switch-case/)
