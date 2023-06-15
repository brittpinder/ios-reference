import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// Serial vs. Concurrent Queues

//let queue = DispatchQueue(label: "example")
//let queue = DispatchQueue(label: "example", attributes: .concurrent)

//queue.async {
//    print("Task 1 started")
//    sleep(5)
//    print("Task 1 ended")
//}
//
//queue.async {
//    print("Task 2 started")
//    sleep(2)
//    print("Task 2 ended")
//}

//------------------------------------------

// Sync vs. Async

//let queue = DispatchQueue(label: "example")
//
//print("before scheduling")
//queue.async { // change to sync
//    for i in 1...3 {
//        print(i)
//    }
//}
//print("after scheduling")

// before scheduling
// after scheduling
// 1
// 2
// 3

//------------------------------------------

// Sync with Concurrent Queue

let queue = DispatchQueue(label: "example", attributes: .concurrent)

queue.sync {
    print("Task 1 started")
    sleep(5)
    print("Task 1 ended")
}

queue.sync {
    print("Task 2 started")
    sleep(2)
    print("Task 2 ended")
}

// Task 1 started
// Task 1 ended
// Task 2 started
// Task 2 ended
