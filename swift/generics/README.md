# Generics

Generics in Swift are like templates in C++. They enable you to write flexible, reusable code that can be used with any type, subject to requirements that you define. For example, the following function allows you to swap two values of any type, as long as they have the same type:

```swift
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
```

It can be used to swap two `Int` values:

```swift
var num1 = 34
var num2 = 16

swapValues(&num1, &num2)

print(num1) // 16
print(num2) // 34
```

Or it can be used to swap to `String` values:

```swift
var name1 = "Bob"
var name2 = "Fred"

swapValues(&name1, &name2)

print(name1) // Fred
print(name2) // Bob
```

<br/>

## Type Parameters

Type parameters specify and name a placeholder type, and are written immediately after the function's name, between a pair of angle brackets. In the example above, the placeholder type `T` is an example of a type parameter.

Once you specify a type parameter, you can use it to define the type of a function's parameters, the function's return type or type annotations within the body of the function. In each case, the type parameter is replaced with an *actual* type whenever the function is called.

You can provide more than one type parameter by writing multiple type parameter names within the angle brackets, separated by commas: `<Type1, Type2, Type3>`

In most cases, type parameters have descriptive names, such as `Key` and `Value` in `Dictionary<Key, Value>` and `Element` in `Array<Element>`. When there isn't an obvious meaningful name, it's common practice to name them using single letters such as `T`, `U` and `V`.