# iOS Interview Questions

#### Can you describe the iOS application lifecycle?

<br/>

#### What is a view controller, and what is its role in iOS development?

<br/>

#### What is a strong reference cycle (retain cycle)?

Swift uses *Automatic Reference Counting (ARC)* to manage memory by keeping track of how many references there are to each class instance, and deallocating an instance when its reference count reaches zero. A strong reference cycle occurs when two objects hold strong references to each other, causing them to be kept in memory indefinitely because their reference counts can never reach zero. Strong reference cycles can result in memory leaks because memory is never deallocated for objects that are no longer in use. To prevent strong reference cycles, use *weak* or *unowned* references which do not increase the reference count for an instance.

<br/>

#### What is the difference between strong and weak references?

The main difference between strong and weak references is that strong references will increase the reference count of an object, whereas a weak reference will not. As long as there is at least one strong reference to an object, that object cannot be deallocated. If the only remaining references to an object are weak (and/or unowned), that object will be deallocated.

Strong references are created by default unless you specifically use the `weak` or `unowned` keyword. Weak references must be optional variables because they will be set to `nil` when the instance they refer to is deallocated.

<br/>

#### What is the difference between weak and unowned references?

<br/>

#### What are the similarities and differences between structs and classes in Swift?

**Similarities**

* Both are used to define custom data types
* Both can have initializers, methods, properties and subscripts
* Both can implement protocols
* Both can be extended

**Differences**

* Classes are *reference* types whereas structs are *value* types
	* When a struct is assigned to a variable, its value is copied. When a class is assigned to a variable, its reference to the underlying object is copied. 
	* Class instances are managed using Automatic Reference Counting (ARC) whereas struct instances are automatically deallocated when they are no longer needed
* Classes support inheritance whereas structs do not
* Classes are mutable whereas structs are immutable
* Classes have deinitializers whereas structs do not

<br/>

#### How do you implement persistence in iOS applications?

<br/>

#### Can you describe how to use delegates and protocols in iOS development?

<br/>

#### What is the difference between synchronous and asynchronous execution?

<br/>

#### Can you explain how to use Auto Layout in iOS development?

<br/>

#### Can you describe the difference between a frame and a bounds in iOS development?

<br/>

#### How do you handle errors in iOS development?

<br/>

#### Can you explain the concept of optionals in Swift, and how do they help with error handling in iOS development?

<br/>

#### Can you explain how to use CocoaPods in iOS development?

<br/>

#### Can you describe how to use a REST API in iOS development?

<br/>

#### Can you explain how to use GCD (Grand Central Dispatch) in iOS development?

<br/>

#### What are some of the most common issues that can cause an iOS application to crash, and how do you address them?

<br/>

#### What is a closure in Swift?

<br/>

#### Can you explain the concept of protocols in Swift, and how do they help with code reuse and extensibility?

<br/>

#### What are some common design patterns used in Swift programming, and how do they help with iOS development?

<br/>

# Experience Questions

#### Can you describe a time when you had to solve a difficult problem in your iOS development work, and how you went about solving it?

