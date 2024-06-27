# Swift Concurrency

Swift 5.5 introduced a new approach for writing asynchronous code that provides a safer and more readable way to manage concurrent tasks compared to traditional techniques like Grand Central Dispatch. This new approach allows you to write asynchronous code in a way that looks and feels synchronous, making it less error prone and much easier to reason about.

<br/>

## async/await

### Synchronous vs. Asynchronous Functions

Most functions that you encounter are *synchronous* - they execute all of their work in order, line by line on a single thread. They are very easy to understand but an important downside is that they are *blocking* - the thread that a synchronous function runs on can't do any other work until the function has finished.

*Asynchronous* functions on the other hand can be suspended partway through their execution, allowing other work to take place. When an asynchronous function is suspended, it doesn't block the current thread - it allows other code to execute while it waits for the operation to complete.

<br/>

### Defining and Calling Asynchronous Functions

To make a function asynchronous, simply add the `async` keyword to its declaration, right after the parameters.

```swift
func fetchTemperature() async -> Int {
    return Int.random(in: -20...30)
}
```
To call an asynchronous function, you must use the `await` keyword. Failing to do so will result in a compiler error.

```swift
let temperature = await fetchTemperature()
```

The `await` keyword marks a possible suspension point, indicating that the current piece of code might pause execution while it waits for the asynchronous function to return. This is also called "yielding a thread" because, behind the scenes, Swift suspends the execution of your code on the current thread and runs some other code on that thread instead.

<br/>

### Blocking Example

Let's look at a practical example. Suppose we had a simple application that fetches the temperature from a server and displays it on screen, as well as a button that increments a counter:

![](images/1.png)

Our code might look something like this:

```swift
struct ContentView: View {
    @State private var temperature = 0
    @State private var count = 0

    var body: some View {
        VStack {
            Text("\(temperature)°")

            Button("Check Weather") {
                temperature = fetchTemperature()
            }

            Text("\(count)")

            Button("Increment") {
                count += 1
            }
        }
    }

    func fetchTemperature() -> Int {
        sleep(3)
        return Int.random(in: -20...30)
    }
}
```
> Note: Modifiers have been excluded for brevity

<br/>

Notice how the `fetchTemperature()` function sleeps for 3 seconds, simulating the delay that a network request might make. When we trigger this function by pressing the "Check Weather" button, our UI freezes up and we can't interact with the other button to increment the count. This is because `fetchTemperature()` is a synchronous function - it blocks the current thread until it has finished all of its work.

![](images/2.gif)

<br/>

We can improve this by changing `fetchTemperature()` to an asynchronous function:

```swift
func fetchTemperature() async -> Int {
    sleep(3)
    return Int.random(in: -20...30)
}
```

And calling it using `await`:

```swift
Button("Check Weather") {
    Task {
        temperature = await fetchTemperature()
    }
}
```
> Note: We are also executing the asynchronous function within a `Task`. More on that later.

<br/>

Now, whenever we press the "Check Weather" button, our UI no longer freezes and we are free to interact with the other button while the `fetchTemperature()` function performs its work.

![](images/3.gif)

<br/>

### Where asynchronous functions can be called

Because code written with `await` needs to be able to suspend execution, there are only certain places where asynchronous functions can be called:

1. From another asynchronous function
2. From the static main() method of a structure, class or enumeration that's marked with @main
3. From an unstructured child task

<br/>

### Calling asynchronous functions from asynchronous functions

Asynchronous functions can call other asynchronous functions and doing so is quite straight-forward. Suppose we wanted to build an app that created thumbnails by fetching images from a server, resizing them and then uploading them back to the server. These three actions might take some time so we could put them in separate asynchronous functions and then call them in sequence from another asynchronous function, `createThumbnails()`:

```swift
func fetchImages() async -> [UIImage] {
    print("Fetching images...")
    sleep(3)
    return [UIImage(), UIImage(), UIImage()]
}

func resizeImages(_ images: [UIImage]) async -> [UIImage] {
    print("Resizing images...")
    sleep(3)
    return images
}

func uploadImages(_ images: [UIImage]) async -> String {
    print("Uploading images...")
    sleep(3)
    return "OK"
}

func createThumbnails() async -> String {
    let images = await fetchImages()
    let resizedImages = await resizeImages(images)
    let result = await uploadImages(resizedImages)
    return result
}

let result = await createThumbnails()
print(result)
```

Each of the `await` calls inside `createThumbnails()` is a potential suspension point which is why they are explicitly marked. Swift will run each of the `await` calls in sequence, waiting for the previous one to complete. While `createThumbnails()` is waiting for each call to complete, the thread it is running on is free to do other work.