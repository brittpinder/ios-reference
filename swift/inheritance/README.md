# Inheritance

A class can *inherit* methods, properties, and other characteristics from another class. When one class inherits from another, the inheriting class is known as a *subclass*, and the class it inherits from is known as its *superclass*.

In the below example, `Shape` is the superclass and `Circle` is the subclass. `Circle` inherits all of the properties and methods from `Shape`.

```swift
class Shape {
    var color = "blue"

    func draw() {
        print("Drawing a \(color) shape")
    }
}

class Circle: Shape {
    var radius = 50

    override func draw() {
        print("Drawing a \(color) circle with radius \(radius)")
    }
}

let shape = Shape()
shape.draw() // Drawing a blue shape

let circle = Circle()
circle.color = "green"
circle.draw() // Drawing a green circle with radius 50
```
> When overriding a function from a superclass, you need to mark it with the `override` keyword

<br/>

## Overriding Properties

Inheritance allows you to override properties as well as methods. In the below example, `Car` overrides the computed property `description` to provide a custom description that includes the gear. It also overrides the stored property `currentSpeed` in order to add a property observer that updates the gear when the speed changes.

```swift
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) km/h"
    }
}

class Car: Vehicle {
    var gear: Int = 1

    override var description: String {
        return super.description + " in gear \(gear)"
    }
    
    override var currentSpeed: Double {
	    didSet {
	        gear = Int(self.currentSpeed / 30)
	    }
	}
}
    
var myCar = Car()
myCar.currentSpeed = 65
print(myCar.description) // traveling at 65.0 km/h in gear 2
```
<br/>

## Final

You can prevent a class, method, property, or subscript from being overridden by marking it as `final`. Any attempt to override something marked as `final` will produce a compile-time error.

In the below example, the class `B` produces an error because it's trying to inherit from a class marked as `final`.

```swift
final class A { }

class B: A { } // Error: Inheritance from a final class 'A'
```

In the below example, an error is produced because `Goldfish` is trying to override the `swim()` method from its superclass, but it's marked as `final`

```swift
class Fish {
    final func swim() {
        print("Just keep swimming")
    }
}

class Goldfish: Fish {
    override func swim() { // Error: Instance method overrides a 'final' instance method

    }
}
```

<br/>

## Polymorphism

Polymorphism allows objects of different classes to be treated as objects of a common superclass. In the below example, the function `makeNoise` takes a value of type `Pet`, but we can pass it values like `Dog` and `Husky` because they inherit from `Pet`.

```swift
class Pet {
    func speak() {
        print("...")
    }
}

class Dog: Pet {
    override func speak() {
        print("Woof")
    }
}

class Husky: Dog {
    override func speak() {
        print("Awwwooooo")
    }
}

func makeNoise(with pet: Pet) {
    pet.speak()
}

makeNoise(with: Pet()) // ...
makeNoise(with: Dog()) // Woof
makeNoise(with: Husky()) // Awwwooooo
```
<br/>

## Type Checking

You can use the *type check operator* (`is`) to check whether an instance is of a certain subclass type. In the below example, we can count the number of dogs in the pet array using `is` to check the type.

```swift
let pets = [Pet(), Dog(), Dog(), Pet(), Husky()]

var numDogs = 0

for pet in pets {
    if pet is Dog {
        numDogs += 1
    }
}

print("There are \(numDogs) dogs") // There are 3 dogs
```
> Notice how the husky is counted as a dog since it inherits from `Dog`

<br/>

## Downcasting

When you believe that a constant or variable of a certain class type may actually refer to an instance of a subclass, you can try to downcast it to the subclass with a *type cast operator* (`as?` or `as!`).

### Optional Downcasting with `as?`

Since downcasting can fail, `as?` is the safest option because it returns an optional. If the downcast was successful, the optional will contain a value and if it's not successful it will contain nil.

In the below example `as?` is used along with `if let` to safely unwrap the animals downcasted to their subclasses of `Reptile` and `Bird`.

```swift
let animals: [Animal] = [Bird(), Reptile(), Bird()]

for animal in animals {
    if let reptile = animal as? Reptile {
        reptile.shedSkin()
    } else if let bird = animal as? Bird {
        bird.fly()
    }
}
// Flapping wings
// Shedding skin
// Flapping wings
```

### Forced Downcasting with `as!`

If you are absolutely certain of an instance's subclass you can force downcast using `as!`. However, if you are wrong, this will crash your app, so be careful.

In the below example we have an array of `Animal` objects but we can see that it only contains instances of type `Bird`, so we can safely use `as!` to force downcast them.

```swift
var birds: [Animal] = [Bird(), Bird(), Bird()]

for animal in birds {
    let bird = animal as! Bird
    bird.fly()
}
// Flapping Wings
// Flapping Wings
// Flapping Wings
```

Alternatively, you could force downcast the entire array of type `[Animal]` to type `[Bird]`:

```swift
for bird in birds as! [Bird] {
    bird.fly()
}
// Flapping Wings
// Flapping Wings
// Flapping Wings
```

<br/>

## Upcasting

While seldom used, it is possible to "upcast" from a subclass to a super class using `as`. Here we are taking an instance of `Bird` and upcasting it to an instance of type `Animal`.

```swift
let bird: Bird = Bird()
bird.identify() // I am a bird

let animal: Animal = bird as Animal
animal.identify() // I am a bird
//animal.fly() // Error: Value of type 'Animal' has no member 'fly'
```
> Notice how after we perform the upcast and call `animal.identify()`, it calls the `identify()` function of `Bird`. This is because `animal` is still of type `Bird` behind the scenes.

<br/>

## Links
* [Apple Documentation on Inheritance](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance)
* [Apple Documentation on Type Casting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting)