# Keywords

### [`class`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures)

* A general-purpose, flexible construct, containing properties and methods
* Classes are *reference* types and allow inheritance
* Referenced in [Structures and Classes](https://github.com/brittpinder/ios-reference/tree/main/swift/structs-vs-classes)

<br/>

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

### [`indirect`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations/#Recursive-Enumerations)

* Indicates that an enumeration or an enumeration case is recursive
* Referenced in [Enums](https://github.com/brittpinder/ios-reference/tree/main/swift/enums#recursive-enumerations)

<br/>

### [`init`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization#Initializers)

* Defines the initializer of a struct or class
* Referenced in [Structures and Classes](https://github.com/brittpinder/ios-reference/tree/main/swift/structs-vs-classes#initialization)

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

### [`let`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Declaring-Constants-and-Variables)

* Used to declare a constant
* Referenced in [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties)

<br/>

### [`mutating`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/methods#Modifying-Value-Types-from-Within-Instance-Methods)

* Allows modification of value types (such as structures and enumerations) from within its instance methods
* Referenced in [Structures and Classes](https://github.com/brittpinder/ios-reference/tree/main/swift/structs-vs-classes#mutability) and [Enums](https://github.com/brittpinder/ios-reference/tree/main/swift/enums#enums-with-mutating-functions)

<br/>

### [`nil`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#nil)

* Represents the absence of a valid object
* Referenced in [Optionals](https://github.com/brittpinder/ios-reference/tree/main/swift/optionals)

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

### [`self`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour#Objects-and-Classes)

* An implicit property that each instance of a type has, that refers to the instance itself
* Referenced in [Structures and Classes](https://github.com/brittpinder/ios-reference/tree/main/swift/structs-vs-classes)

<br/>

### [`set`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Computed-Properties)

* Defines the "setter" of a computed property
* Referenced in [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties#setting-computed-properties)

<br/>

### [`struct`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures)

* A general-purpose, flexible construct, containing properties and methods
* Structs are *value* types and don't allow inheritance
* Referenced in [Structures and Classes](https://github.com/brittpinder/ios-reference/tree/main/swift/structs-vs-classes)

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

### [`var`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Declaring-Constants-and-Variables)

* Used to declare a variable
* Referenced in [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties)

<br/>

### [`willSet`](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Property-Observers)

* A *property observer* that gets called right before a property is set
* Referenced in [Properties](https://github.com/brittpinder/ios-reference/tree/main/swift/properties#property-observers)

<br/>

## To Add
* `_`
* `as`
* `associatedType`
* `associativity`
* `convenience`
* `defer`
* `deinit`
* `dynamic`
* `enum`
* `extension`
* `fallthrough`
* `func`
* `import`
* `in`
* `infix`
* `inout`
* `is`
* `left`
* `none`
* `nonmutating`
* `operator`
* `optional`
* `postfix`
* `prefix`
* `protocol`
* `precedencegroup`
* `repeat`
* `required`
* `rethrows`
* `right`
* `static`
* `subscript`
* `super`
* `typealias`
* `unowned`
* `weak`
* `where`
* `#available`
* `#column`
* `#else`
* `#elseif`
* `#endif`
* `#error`
* `#file`
* `#filePath`
* `#function`
* `#if`
* `#line`
* `#selector`
* `#sourceLocation`
* `#warning`
* `@autoclosure`
* `@available`
* `@discardableResult`
* `@dynamicCallable`
* `@dynamicMemberLookup`
* `@escaping`
* `@objc`
* `@objcMembers`
* `@unknown`


## Links

* [All the Reserved Keywords in Swift](https://betterprogramming.pub/all-the-reserved-keywords-in-swift-17efcfaa3f3e)
