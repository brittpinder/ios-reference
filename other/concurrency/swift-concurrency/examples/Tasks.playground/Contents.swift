import UIKit

// Basic Task
Task {
    print("Hello World")
}


// Task returning a value
let task1 = Task {
    return Int.random(in: 1...10)
}

Task {
    let number = await task1.value
    print(number)
}


// Task returning value or error
enum FetchError: Error {
    case failed
}

let task2 = Task {
    if Bool.random() {
        throw FetchError.failed
    }

    return Int.random(in: 1...10)
}

Task {
    do {
        let number = try await task2.value
        print(number)
    } catch {
        print(error)
    }
}
