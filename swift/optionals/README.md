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

<br/>

## Unwrapping Optionals

Notice in the above example, when `optionalString` has a value and we print it, it prints `Optional("Hello")` instead of `Hello`. In order to get the value that the optional is storing, we need to "unwrap" it. There are four options for unwrapping optionals:

1. [Force Unwrapping](#force-unwrapping)
2. [Optional Binding](#optional-binding)
3. [Optional Chaining](#optional-chaining)
4. [Nil-Coalescing Operator](#nil-coalescing-operator)

<br/>

### Force Unwrapping
Force unwrapping is performed by adding an exclamation point (!) after an optional.

```swift
var age: Int? = 65

print(age) // Optional(65)
print(age!) // 65
```

Force unwrapping an optional is the easiest method but also the most dangerous because if you force unwrap an optional that doesn't contain a value, your app will crash.

```swift
var age: Int?

print(age) // nil
print(age!) // Fatal error: Unexpectedly found nil while unwrapping an Optional value
```


You should only force unwrap an optional if you are absolutely certain that it contains a value (for example, if you explicitly check that the value is not `nil`)

```swift
if age != nil {
    print(age!) // 65
}
```
<br/>

### Optional Binding

Optional binding will unwrap an optional only if it exists and store that unwrapped value in a temporary variable. This can be done using `if let`, `guard let` or `switch`.

<br/>

#### Optional Binding with `if let`
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
<br/>

#### Optional Binding with `guard let`

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

> Tip: As a guiding principle, `if let` should be used when the nil case is valid (ex: a text field being empty) whereas `guard let` should be used when the nil case represents some sort of error.

<br/>

#### Optional Binding with `switch`

Behind the scenes, an optional is simply an enum containing two cases: `none` and `some`:

```swift
enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
}
```

This means that you can optionally bind by switching on the two enum values:

```swift
var name: String? = "Taylor"

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
var firstName: String? = "Taylor"
var lastName: String?

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
<br/>

### [Optional Chaining](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/optionalchaining)

Optional chaining allows you to call properties, methods and subscripts on optionals that might currently be `nil`. If the optional contains a value, the property, method or subscript call succeeds. If the optional is `nil`, the property, method or subscript call returns `nil`.

In the following example, `dog` doesn't contain a value, so the expression `dog?.name` returns `nil` and `dogName` is assigned a type of `Optional<String>` with a value of `nil`.

```swift
struct Dog {
    var name: String
}

var dog: Dog?

var dogName = dog?.name
print(dogName) // nil
print(type(of: dogName)) // Optional<String>
```

If we assign a value to `dog`, and then use optional chaining to reassign `dogName`, `dogName` is still an optional but holds the value "Jango".

```swift
dog = Dog(name: "Jango")
dogName = dog?.name
print(dogName) // Optional("Jango")
print(type(of: dogName)) // Optional<String>
```
<br/>

#### Optional Chaining with Functions

Optional chaining can also be used to call functions. In the below example, the function `bark()` is only executed if `dog` has a value.

```swift
struct Dog {
    var name: String

    func bark() {
        print("woof")
    }
}

var dog: Dog?
dog?.bark() // bark() is not executed because dog doesn't contain a value

dog = Dog(name: "Jango")
dog?.bark() // woof
```
When using optional chaining to call a method on an optional value, you can check whether that method call is successful by comparing the return type to `nil`. This works even for functions that don't define a return type because they have an implicit return type of `Void`.

```swift
if dog?.bark() != nil {
    print("Good dog")
}
// Prints "woof"
// Prints "Good dog"
```
<br/>

#### Setting Properties through Optional Chaining

Optional chaining can also be used to set properties on optional variables. In the following example, `name` is only set when `dog` contains a value.

```swift
var dog: Dog?

dog?.name = "Aayla"
print(dog?.name) // nil

dog = Dog(name: "Jango")
dog?.name = "Aayla"
print(dog?.name) // Aayla
```

Any attempt to set a property through optional chaining returns a value of type `Void?` which means that you can compare against nil to check if the property was set successfully:

```swift
if (dog?.name = "Luna") != nil {
    print("Dog's name was set to \(dog?.name)")
}
// Prints "Dog's name was set to Optional("Luna")
```
<br/>

#### Linking Multiple Levels of Chaining

Multiple queries can be chained together, and the entire chain fails gracefully if any link in the chain is nil. Consider the example where `Dog` has an optional property of type `Person`.

```swift
struct Person {
    let name: String
    var age: Int
}

struct Dog {
    var name: String
    var owner: Person?
}

var dog: Dog?

var dogOwnerAge = dog?.owner?.age
print(dogOwnerAge) // nil because dog doesn't contain a value
print(type(of: dogOwnerAge)) // Optional<Int>
```
Using optional chaining, we can drill down to find the age of the dog's owner and store it in `dogOwnerAge`. However, the unwrapping gracefully fails since `dog` doesn't contain a value. `dogOwnerAge` is assigned a value of `nil` and a type of `Optional<Int>`.

Below, we can try the same thing after giving `dog` a value, but the optional chaining still fails since `owner` doesn't have a value.

```swift
dog = Dog(name: "Jango")

dogOwnerAge = dog?.owner?.age
print(dogOwnerAge) // nil
print(type(of: dogOwnerAge)) // Optional<Int>
```
Finally, the optional chaining will succeed if we give a value to `owner`:

```swift
dog?.owner = Person(name: "Warren", age: 42)

dogOwnerAge = dog?.owner?.age
print(dogOwnerAge) // Optional(42)
print(type(of: dogOwnerAge)) // Optional<Int>
```

<br/>

### Nil-Coalescing Operator

The nil-coalescing operator (??) allows you to supply a default value in case the optional instance is `nil`. In the below example, `menu` will be assigned to `specialMenu` if `specialMenu` holds a value. Otherwise it will be assigned to the default value of `regularMenu`.

```swift
var regularMenu = "Regular Menu"
var specialMenu: String?

var menu = specialMenu ?? regularMenu
print(menu) // Regular Menu
```

<br/>

## Implicitly Unwrapped Optionals

An implicitly unwrapped optional, written with an exclamation mark (!) after the type (ex: `String!`), is like a regular optional in that it can contain a value or be `nil`, however it doesn't need to be unwrapped before it is used. There is a danger in this because if for whatever reason, your implicitly unwrapped optional contains `nil`, your app will crash and you won't be able to prevent it. Therefore implicitly unwrapped optionals require you to be absolutely sure there's a value before you use them.

The most common reason for using an implicitly unwrapped optional is in the case where something will start off as `nil` but contain a value by the time it's needed and won't be `nil` ever again. For example, when outlets are created using Interface Builder, they are created as implicitly unwrapped optionals because they are `nil` when the view controller is being created and get set to real values shortly after (and won't be destroyed until the view controller is destroyed).

`@IBOutlet weak var searchTextField: UITextField!`

<br/>

## Links
* [Apple Documentation on Optional](https://developer.apple.com/documentation/swift/optional)
* [Swift Optionals Video Tutorial](https://www.youtube.com/watch?v=ZL8BFK8bVjk&ab_channel=SeanAllen)
* [Optional Binding with Switch](https://sarunw.com/posts/optional-binding-switch-case/)
* [Apple Documentation on Optional Chaining](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/optionalchaining)
