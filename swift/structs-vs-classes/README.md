# Structures and Classes

Structs in Swift are much more powerful than structs in other languages like C++. Here is an overview of capabilities of structs and classes:

Feature | Struct | Class
---|---|---
Define properties to store values | :heavy_check_mark: | :heavy_check_mark:
Define methods to provide functionality | :heavy_check_mark: | :heavy_check_mark:
Define subscripts to provide access to their values using subscript syntax | :heavy_check_mark: | :heavy_check_mark:
Define initializers to set up their initial state | :heavy_check_mark: | :heavy_check_mark:
Default initializer provided | :heavy_check_mark: | 
Be extended to expand their functionality beyond a default implementation | :heavy_check_mark: | :heavy_check_mark:
Conform to protocols to provide standard functionality of a certain kind| :heavy_check_mark: | :heavy_check_mark:
Inheritance |  | :heavy_check_mark:
Type casting enables you to check and interpret the type of an instance at runtime |  | :heavy_check_mark:
Deinitializers enable an instance to free up any resources it has assigned |  | :heavy_check_mark:
Reference counting allows more than one reference to an instance |  | :heavy_check_mark:
Mutable |  | :heavy_check_mark:
Create deep copies that are not references | :heavy_check_mark: |
Threadsafe | :heavy_check_mark: |
Compatible with Objective-C code |  | :heavy_check_mark:
Pass by value/reference | value | reference
Live on the stack/heap | stack | heap

## Choosing Between Structures and Classes
It can be difficult to know whether or not to use a Struct or a Class. Below are some recommendations:

* Use structures by default
* Use classes when you need Objective-C interoperability
* Use classes when you need to control the identity of the data you're modeling
* Use structures along with protocols to adopt behavior by sharing implementations. Prefer protocol inheritance first whether you are using structs or classes. If you need non-protocol inheritance, then use a class.

## Helpful Links
* [Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)
* [Structs vs Classes Video](https://www.youtube.com/watch?v=LtlbB4-6k_U&ab_channel=SeanAllen)


