# Networking

There are many ways in which network requests can be made in Swift:

1. **URLSession** - Native API provided by Apple for making HTTP requests
2. **Concurrency (async/await)** - Newer approach introduced in Swift 5.5
3. **Third-party libraries** such as Alamofire
4. **Combine Framework** - Useful for handling data streams and complex asynchronous workflows

<br/>

Regardless of the way in which you choose to make your network requests, you will need to follow these essential steps:

1. **Define a Model:** Create a model (struct) to represent the JSON data that you expect to receive from the network call. This model should conform to the `Decodable` protocol so that it can be decoded from JSON by a `JSONDecoder`.
2. **Create a URL:** Create a `URL` representing the endpoint of the network request you intend to make
3. **Configure the URLRequest (optional):** If you need to set the HTTP method or specify any headers or body data, you can configure a `URLRequest` object. If you are making a simple GET request, you can often skip this step.
4. **Execute the Network Call:** Make the network request using one of the methods listed above
5. **Handle the Response:** Handle the response returned from the network request, checking the status code and catching any errors
6. **Decode the Data:** If the network request was successful and no errors were encountered, you can decode the returned data (typically JSON) into your model struct using a `JSONDecoder`

<br/>

## [URLSession](https://developer.apple.com/documentation/foundation/urlsession)

Suppose we wanted to create a simple application that fetches a joke from the internet ([Official Joke API](https://github.com/15Dkatz/official_joke_api)) and displays it on screen with the click of a button:

![](images/1.png)

We could do this using `URLSession` like so:

```swift
// 1. Define a model
struct Joke: Codable {
    let setup: String
    let punchline: String
}

// View struct (modifiers have been omitted for brevity)
struct ContentView: View {
    @State private var joke: Joke?

    var body: some View {
        VStack {
            if let joke {
                Text(joke.setup)
                Text(joke.punchline)
            }
            Button("Tell me a joke") {
                fetchJoke()
            }
        }
    }

    func fetchJoke() {
        // 2. Create a URL
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
            print("Failed to create URL!")
            return
        }

        // 3. Create and configure a URLRequest (optional - you can also just pass url directly to URLSession.shared.dataTask)
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // 5. Handle the response
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid response")
                return
            }

            guard let data = data else {
                print("Error retrieving data!")
                return
            }

            // 6. Decode the data
            do {
                let decodedData = try JSONDecoder().decode(Joke.self, from: data)
                DispatchQueue.main.async {
                    self.joke = decodedData
                }
            } catch {
                print("Error decoding response: \(error.localizedDescription)")
                return
            }
        }

        // 4. Execute the Network Call
        task.resume()
    }
}
```

<br/>

### 1. Define the Model

The url we are using to fetch jokes is `https://official-joke-api.appspot.com/jokes/random` and if you enter it into a browser, you can see that the returned JSON object looks like this:

```
{
  "type": "general",
  "setup": "Why are fish so smart?",
  "punchline": "Because they live in schools!",
  "id": 304
}
```
In order to use this JSON data in our code, we need to define a struct to represent the data:

```swift
struct Joke: Decodable {
    let setup: String
    let punchline: String
}
```
When defining a model, you only need to include the properties of the JSON object that you need. In our case we are only interested in `setup` and `punchline` so we can exclude `type` and `id`.

It is also important that the property names within your model exactly match those within the JSON object - otherwise your retrieved data won't be able to be decoded. If you want to have different property names than those within the JSON object, you can do this by using `CodingKeys`.

Lastly, the struct must conform to `Decodable` (or `Codable` if you want to adopt the `Encodable` protocol as well) so that a `JSONDecoder` can convert raw JSON data into an instance of your struct.

Read more about encoding and decoding custom types [here](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types).

<br/>

### 2. Create a URL

This step is very straightforward. Simply pass a url string into a URL initializer and ensure that it was successfully created. 

```swift
guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
    print("Failed to create URL!")
    return
}
```

<br/>

### 3. Configure the URLRequest

If you are making a simple GET request, you can often skip this step as URLSession will automatically create a URLRequest for you. However, if you need to make a different type of http request (ex: POST) or you need to specify any headers or body data, you will need to initialize a URLRequest manually:

```swift
let request = URLRequest(url: url)
// configure the request here
```

<br/>

### 4. Execute the Network Call

To execute a network call with URLSession, we need to first create a `URLSessionDataTask` which will retrieve the contents of our URL and then trigger it by calling `resume()`. The [initializer](https://developer.apple.com/documentation/foundation/urlsession/1410330-datatask) for a `URLSessionDataTask` takes two parameters: a `URLRequest` (which we have defined above) and a completion handler (a function) to execute when the request returns.

![](images/2.png)

The completion handler is often written inline using a trailing closure and should take care of handling errors, checking the response and decoding the data.

```swift
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    // Handle errors
    // Check the response
    // Decode data
}

task.resume() // Trigger the network call
```
<br/>

> Note: If you do not need to configure a `URLRequest`, you can pass a `URL` into `dataTask` instead:

```swift
let task = URLSession.shared.dataTask(with: url) { data, response, error in
    // Handle errors
    // Check the response
    // Decode data
}
```

<br/>

### 5. Handle the Response

As can be seen above, the completion handler takes three optional parameters: data, response and error. If and how you handle these values is up to you and and your use case, but they are typically handled in reverse order like so:

```swift
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
        print(error.localizedDescription)
        return
    }

    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        print("Invalid response")
        return
    }

    guard let data = data else {
        print("Error retrieving data!")
        return
    }
}
```

<br/>

#### error

If the network request is successful then `error` will be `nil`. If it fails, then `error` will hold an `Error` object indicating why (no internet connection, timed out, no permissions etc.). Here we check if `error` holds a value and if so, we print the description and exit out of the completion handler.

```swift
if let error = error {
    print(error.localizedDescription)
    return
}
```

<br/>

#### response

If the network request successfully returned, the `response` will hold an object of type `HTTPURLResponse` which provides response metadata such as HTTP headers and a status code. It is common to check that the response exists and that the statusCode is 200 (indicating that the request succeeded) as opposed to something like 404 (Not found). Depending on the complexity of your app, you may need to check for and handle various status codes differently.

```swift
guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    print("Invalid response")
    return
}
```

<br/>

#### data

Finally, after checking that we don't have any errors and the response is valid, we need to confirm that data was actually returned from the server.

```swift
guard let data = data else {
    print("Error retrieving data!")
    return
}
```

<br/>

### 6. Decode the Data

Now that we have confirmed that the request was successful, there were no errors and we have some data to work with, we can convert the raw JSON data into our model struct using a `JSONDecoder`. This operation might fail so it has to be marked with `try` and put within a `do-catch` block.

```swift
do {
    let decodedData = try JSONDecoder().decode(Joke.self, from: data) // Decode the JSON data into a Joke struct
    DispatchQueue.main.async {
        self.joke = decodedData // Assign the Joke struct to our @State property
    }
} catch {
    print("Error decoding response: \(error.localizedDescription)")
    return
}
```

It is important to note that the completion handler from `URLSession.shared.dataTask` is asynchronous; it runs on a background thread when the network request returns. All UI operations must be performed on the main thread, so when we assign our decoded data to our @State property `self.joke` (triggering a refresh of the UI), this must be wrapped with `DispatchQueue.main.async` so that it occurs on the main thread.

<br/>

### Using Completion Callbacks

The function `fetchJoke()` above is currently responsible for *a lot* of things: making the network request, printing errors and assigning the data to the `joke` @State property. In larger applications it is common to separate these concerns through the use of completion callbacks.

For example, suppose we wanted to extract the logic for making the network request into a separate class called `NetworkService`. We could do this by passing a function to be executed once the network request comes back. Since a network request can either succeed or fail, it is common to make use of the [`Result`](https://developer.apple.com/documentation/swift/result) type in this callback function.

Now, the `fetchJoke()` function doesn't have to worry about printing errors or assigning the joke value. It can simply call the completion callback with 'success' and the resulting data or 'failure' with the resulting error.

```swift
enum JokeError: String, Error {
    case invalidURL = "Failed to create URL"
    case networkError = "Network request failed"
    case badResponse = "Bad response received from the server"
    case noDataReceived = "Failed to retreive data"
    case decodingError = "Failed to decode data"
}

class NetworkService {
    func fetchJoke(completion: @escaping (Result<Joke, JokeError>) -> Void) {
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
            completion(Result.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(Result.failure(.networkError))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(Result.failure(.badResponse))
                return
            }

            guard let data = data else {
                completion(Result.failure(.noDataReceived))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(Joke.self, from: data)
                completion(Result.success(decodedData))
            } catch {
                completion(Result.failure(.decodingError))
                return
            }
        }

        task.resume()
    }
}
```

Additionally, our call site no longer has to concern itself with the details of making the network request and can instead focus on handling the result of that network request:

```swift
class JokeFetcher: ObservableObject {
    @Published var joke: Joke?
    private var networkService = NetworkService()

    func fetchJoke() {
        networkService.fetchJoke { [weak self] result in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async {
                    self?.joke = joke
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}

struct ContentView: View {
    @StateObject var jokeFetcher = JokeFetcher()

    var body: some View {
        VStack {
            if let joke = jokeFetcher.joke {
                Text(joke.setup)
                Text(joke.punchline)
            }
            Button("Tell me a joke") {
                jokeFetcher.fetchJoke()
            }
        }
    }
}
```

<br/>

## Swift Concurrency (async/await)

Introducing completion callback functions has allowed us to decouple our networking code but it has introduced some new problems:

- We must remember to call the completion handler at each of the appropriate times because the compiler won't complain if we forget
- The code has become harder to follow because it is now dealing with multiple asynchronous callback functions
- Retain cycles now need to be avoided by using weak references

Fortunately, with the introduction of `async`/`await` in Swift 5.5, we can eliminate these problems and make the code much simpler:

```swift
class NetworkService {
    func fetchJoke() async throws -> Joke {
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
            throw JokeError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw JokeError.badResponse
        }

        do {
            return try JSONDecoder().decode(Joke.self, from: data)
        } catch {
            throw JokeError.decodingError
        }
    }
}

struct ContentView: View {
    @State private var joke: Joke?
    private var networkService = NetworkService()

    var body: some View {
        VStack {
            if let joke {
                Text(joke.setup)
                Text(joke.punchline)
            }
            Button("Tell me a joke") {
                Task {
                    do {
                        joke = try await networkService.fetchJoke()
                    } catch {
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
```

Using `async`/`await` allows you to write asynchronous code that looks and behaves like synchronous code. Instead of using the Result type to invoke a callback function, the `fetchJoke()` function simply returns a `Joke` instance if it is successful or throws if it encounters an error.
