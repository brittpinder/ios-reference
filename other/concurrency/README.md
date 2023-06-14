# Concurrency

## [Grand Central Dispatch (GCD)](https://developer.apple.com/documentation/dispatch)

Grand Central Dispatch is a framework provided by Apple that simplifies the process of writing concurrent code. GCD manages a collection of "dispatch queues" which are used to schedule the execution of tasks. Developers push their tasks onto one of the dispatch queues, and GCD takes care of executing these tasks from a pool of threads.

<br/>

## [Dispatch Queue](https://developer.apple.com/documentation/dispatch/dispatchqueue)

A dispatch queue is a FIFO queue that stores blocks of code to be executed. Dispatch queues can be serial or concurrent and tasks can be scheduled on them either synchronously or asynchronously.

### Serials vs Concurrent Queues

Serial queues execute their tasks in order, one at a time. Each task must be completed before the next one can start. Concurrent queues on the other hand can run multiple tasks at the same time. Tasks are started in order but are not necessarily completed in order; tasks started later may finish before tasks that started earlier.

![](images/0.jpg)
