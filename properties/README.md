# Properties

## Stored Properties
A stored property is a constant (`let`) or variable (`var`) that's stored as part of an instance of a particular class or structure.

```swift
struct Person {
    let name: String
    var age: Int
}

var person = Person(name: "Audrey", age: 25)
person.name = "Barbara" // Error: name is a let constant
person.age = 33
```

If you create an instance of a structure using `let`, you can't modify the instance's properties, even if they were declared with `var`. This is because structures are *value* types.

```swift
let constantPerson = Person(name: "Jake", age: 12)
constantPerson.age = 70 // Error: constantPerson is a let constant
```
However, if you create an instance of a *class* using `let`, you can modify its variable properties. This is because classes are *reference* types.

```swift
class Employee {
    let name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let constantEmployee = Employee(name: "Michael", age: 42)
constantEmployee.age = 39 // This is ok
```
When `let` is used to create an instance of a class, it means that the reference cannot be changed. So you can modify the variable values but you cannot reassign the reference:

```swift
constantEmployee = Employee("Dwight", 39) // Error: Cannot assign to value: constantEmployee is a let constant
```

