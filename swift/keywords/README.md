# Keywords

### [`didSet`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Property-Observers)

* A *property observer* that gets called right after a property is set
* Referenced in [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties#property-observers)

<br/>

### [`do-catch`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Error-Handling)

* Used in error handling, a `do` statement creates a new containing scope, which allows errors to be propogated to one or more `catch` clauses
* Referenced in [Error Handling and Assertions](https://github.com/brittpinder/ios-reference/tree/main/swift/error-handling#handling-errors-using-do-catch)

<br/>

### [`fileprivate`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)

* An access level that can be placed on a type (class, method, enum, property etc.)
* Restricts access to the file in which an entity is declared
* Referenced in [Access Control](https://github.com/brittpinder/ios-reference/tree/main/swift/access-control#fileprivate)

<br/>

### [`final`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance#Preventing-Overrides)

* Prevents a class, method, property or subscript from being overriden
* Referenced in [Inheritance](https://github.com/brittpinder/ios-reference/tree/main/swift/inheritance#final)

<br/>

### [`get`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Computed-Properties)

* Defines the "getter" of a computed property
* Referenced in [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties#computed-properties)

<br/>

### [`guard`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Early-Exit)

* Executes statements depending on the Boolean value of an expression. If the expression is true, the code after the guard statement is executed, otherwise the code within the `else` statement is executed.
* The accompanying `else` statement is mandatory and must transfer control to exit the code block in which the guard statement appears (using `return`, `break`, `continue`, `throw`, `fatalError` etc.)
* Referenced in [Optionals](https://github.com/brittpinder/ios-reference/tree/main/swift/optionals#optional-binding)

<br/>

### [`internal`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)

* The default access level placed on a type (class, method, enum, property etc.)
* Restricts access to any source file within the app module
* Referenced in [Access Control](https://github.com/brittpinder/ios-reference/tree/main/swift/access-control#internal)

<br/>

### [`lazy`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Lazy-Stored-Properties)

* Indicates that a stored property's initial value isn't calculated until the first time it's used
* Referenced in [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties#lazy-stored-properties)

<br/>

### [`open`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)

* The least restrictive access level that can be placed on a type (class, method, enum, property etc.)
* Allows access and subclassing to files both within and outside the defining module of the entity
* Referenced in [Access Control](https://github.com/brittpinder/ios-reference/tree/main/swift/access-control#open)

<br/>

### [`override`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance#Overriding)

* Overrides a method, property or subscript from the superclass
* Referenced in [Inheritance](https://github.com/brittpinder/ios-reference/tree/main/swift/inheritance)

<br/>

### [`private`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)

* The most restrictive access level that can be placed on a type (class, method, enum, property etc.)
* Restricts access to the enclosing declaration and to extensions of that declaration within the same file
* Referenced in [Access Control](https://github.com/brittpinder/ios-reference/tree/main/swift/access-control#private)

<br/>

### [`public`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)

* An access level that can be placed on a type (class, method, enum, property etc.)
* Allows access to files both within and outside the defining module of the entity, however, files outside the defining module cannot subclass the entity
* Referenced in [Access Control](https://github.com/brittpinder/ios-reference/tree/main/swift/access-control#public)

<br/>

### [`set`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Computed-Properties)

* Defines the "setter" of a computed property
* Referenced in [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties#setting-computed-properties)

<br/>

### [`throw`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/#Representing-and-Throwing-Errors)

* Used to throw an error
* Referenced in [Error Handling and Assertions](https://github.com/brittpinder/ios-reference/tree/main/swift/error-handling#representing-and-throwing-errors)

<br/>

### [`throws`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/#Propagating-Errors-Using-Throwing-Functions)

* Indicates that a function can throw
* Referenced in [Error Handling and Assertions](https://github.com/brittpinder/ios-reference/tree/main/swift/error-handling#propogating-errors-using-throwing-functions)

<br/>

### [`try`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/#Handling-Errors)

* Used before a piece of code that calls a function, method or initializer that can throw an error
* The alternative `try?` converts the result of the throwing expression to an optional
* The alternative `try!` disables error propogation by wrapping the call in a runtime assertion that no error will be thrown
* Referenced in [Error Handling and Assertions](https://github.com/brittpinder/ios-reference/tree/main/swift/error-handling#handling-errors-using-do-catch)

<br/>

### [`willSet`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Property-Observers)

* A *property observer* that gets called right before a property is set
* Referenced in [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties#property-observers)

<br/>

## Links

* [All the Reserved Keywords in Swift](https://betterprogramming.pub/all-the-reserved-keywords-in-swift-17efcfaa3f3e)
