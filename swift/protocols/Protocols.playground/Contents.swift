import UIKit

protocol FlyingObject {
    func fly()
}

struct Eagle: FlyingObject {
    func fly() {
        print("The eagle soars through the air")
    }
}

class Airplane: FlyingObject {
    func fly() {
        print("The airplane takes off")
    }
}

func makeObjectFly(object: FlyingObject) {
    object.fly()
}

makeObjectFly(object: Eagle()) // The eagle soars through the air
makeObjectFly(object: Airplane()) // The airplane takes off
