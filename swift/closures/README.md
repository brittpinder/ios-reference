# Closures


- Closures are self-contained blocks of functionality that can be passed around and used in your code, much like lambdas in C++

Capturing Values

* Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables.
* Swift handles all of the memory management of capturing for you

Closures take one of three forms

* Global functions are closures that have a name and don't capture any values
* Nested functions are closures that have a name and can capture values from their enclosing function
* Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.

Closure Expression Optimizations

* Inferring parameter and return value types from context
* Implicit returns from single-expression closures
* Shorthand argument names
* Trailing closure syntax

To Cover
* Trailing closure syntax
* `@escaping`

<br/>

## Links

* [Apple Documentation on Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures)
* [Jonathan Rasmusson's Documentation](https://github.com/jrasmusson/level-up-swift/tree/master/4-closures)
* [Video Explanation](https://www.youtube.com/watch?v=ND44vQ5iJyc&ab_channel=SeanAllen)