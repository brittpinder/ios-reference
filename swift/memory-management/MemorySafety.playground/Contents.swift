import UIKit


var stepSize = 1

func increment(_ number: inout Int) {
    number += stepSize
}

var counter = 0
increment(&counter) // This is ok
print(counter) // 1

//increment(&stepSize) // Error: Fatal access conflict detected




func swapValues(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var foo = 2

//swapValues(&foo, &foo)
// Error: Inout arguments are not allowed to alias each other
// Error: Overlapping accesses to 'foo', but modification requires exclusive access; consider copying to a local variable


struct Player {
    var energy: Int
    var health: Int

    mutating func transferEnergy(to otherPlayer: inout Player) {
        otherPlayer.energy += energy
        energy = 0
    }
}

var oscar = Player(energy: 10, health: 100)
var kevin = Player(energy: 5, health: 100)

oscar.transferEnergy(to: &kevin)

print(oscar.energy) // 0
print(kevin.energy) // 15

//kevin.transferEnergy(to: &kevin)
// Error: Inout arguments are not allowed to alias each other
// Error: Overlapping accesses to 'kevin', but modification requires exclusive access; consider copying to a local variable




var position = (x: 4, y: 7)
//swap(&position.x, &position.y) // Error: Fatal access conflict detected


//var angela = Player(energy: 20, health: 100)
//swap(&angela.energy, &angela.health) // Error: Fatal access conflict detected


func someFunction() {
    var angela = Player(energy: 20, health: 100)
    swap(&angela.energy, &angela.health)

    print(angela.energy) // 100
    print(angela.health) // 20
}

someFunction()
