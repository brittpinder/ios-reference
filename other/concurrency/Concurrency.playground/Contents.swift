import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let queue = DispatchQueue(label: "example")
//let queue = DispatchQueue(label: "example", attributes: .concurrent)

queue.async {
    print("Task 1 started")
    sleep(5)
    print("Task 1 ended")
}

queue.async {
    print("Task 2 started")
    sleep(2)
    print("Task 2 ended")
}
