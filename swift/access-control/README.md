# [Access Control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol)

Access control restricts access to parts of your code from code in other *source files* and *modules*. It enables you to hide the implementation details of your code, and to specify a preferred interface through which that code can be accessed and used.

**Modules**

* A module is a single unit of code distribution — a framework or application that’s built and shipped as a single unit and that can be imported by another module with Swift’s import keyword.
* Each build target (such as an app bundle or framework) in Xcode is treated as a separate module in Swift.

**Source Files**

- A source file is a single Swift source code file within a module (in effect, a single file within an app or framework).
- Although it’s common to define individual types in separate source files, a single source file can contain definitions for multiple types, functions, and so on.

<br/>

## Access Levels

There are five different access levels in Swift:

### private

* The most restrictive access level
* Access is restricted to the enclosing declaration and to extensions of that declaration within the same file

### fileprivate

* Access is restricted to the file in which an entity is declared

### internal

* Access is restricted to any source file within the app module
* This is the default access level so it doesn't need to be explicitly defined with the `internal` keyword

### public

* Source files from within and outside the defining module can access the entity
* However, even though source files outside the defining module can access the entity, they cannot *subclass* the entity
* Typically used when specifying the public interface to a framework

### open

* The least restrictive access level
* Source files from within and outside the defining module can access and subclass the entity
* Typically used when specifying the public interface to a framework

If you are creating a single target application, you will only need to concern yourself with  `private`, `fileprivate` or `internal`. If you are creating a framework, you will additionally need to use `public` and/or `open` to define your framework's public facing interface (API).

<br/>

## Links
* [Apple Documentation on Access Control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol)