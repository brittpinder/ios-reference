# Concurrency

## [Grand Central Dispatch (GCD)](https://developer.apple.com/documentation/dispatch)

Grand Central Dispatch is a framework provided by Apple that simplifies the process of writing concurrent code. GCD manages a collection of "dispatch queues" which are used to schedule the execution of tasks. Developers push their tasks onto one of the dispatch queues, and GCD takes care of executing these tasks from a pool of threads.

<br/>

## [Dispatch Queue](https://developer.apple.com/documentation/dispatch/dispatchqueue)

A dispatch queue is a FIFO queue that stores blocks of code to be executed. Dispatch queues can be serial or concurrent and tasks can be scheduled on them either synchronously or asynchronously.

### Serials vs Concurrent Queues

Serial queues execute their tasks in order, one at a time. Each task must be completed before the next one can start. Concurrent queues on the other hand can run multiple tasks at the same time. Tasks are started in order but are not necessarily completed in order; tasks started later may finish before tasks that started earlier.

![](images/0.jpg)

The code below creates a serial queue (`DispatchQueue` is serial by default) and adds two tasks to it. The first task takes 5 seconds to complete and the second task takes 2 seconds to complete.

```swift
let queue = DispatchQueue(label: "example")

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
```
Since it is a serial queue, these tasks are executed one at a time as can be seen by the print statements:

```swift
Task 1 started
Task 1 ended
Task 2 started
Task 2 ended
```
"Task 1 started" gets printed first, followed by "Task 1 ended" 5 seconds later. Then "Task 2 started " is printed, followed by "Task 2 ended" 2 seconds later.

However, if we change the queue to a concurrent one like so:

```swift
let queue = DispatchQueue(label: "example", attributes: .concurrent)
```

The tasks are executed differently:

```swift
Task 1 started
Task 2 started
Task 2 ended
Task 1 ended
```

"Task 1 started" and "Task 2 started" are printed right away, indicating that both tasks have been started. Two seconds later, "Task 2 ended" is printed and three seconds after that, "Task 1 ended" is printed. This is because we are now executing the tasks on a concurrent queue. The tasks are started in order and then run simultaneously. Since the second task doesn't take as much time, it finishes before the first task.
