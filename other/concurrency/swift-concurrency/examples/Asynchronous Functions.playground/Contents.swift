import UIKit

// Basic example of async/await
func fetchTemperature() async -> Int {
    return Int.random(in: -20...30)
}

Task.detached {
    let temperature = await fetchTemperature()
    print(temperature)
}

// Calling asynchronous functions from other asynchronous functions
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
    print("Finished fetching images")

    let resizedImages = await resizeImages(images)
    print("Finished uploading images")

    let result = await uploadImages(resizedImages)
    print("Finished uploading images")

    return result
}

Task.detached {
    let result = await createThumbnails()
    print(result)
}

// Asynchronous Throwing Function
func fetchNews() async throws -> Data? {
    let url = URL(string: "https://hws.dev/news-1.json")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
}

Task.detached {
    let data = try await fetchNews()
}

// Async let
func downloadBook(name: String) async -> String {
    print("Downloading \(name)...")
    sleep(2)
    return ("Contents of \(name)")
}

Task.detached {
    let book1 = await downloadBook(name: "Harry Potter")
    let book2 = await downloadBook(name: "The Hobbit")
    let book3 = await downloadBook(name: "Catch-22")

    let books = [book1, book2, book3]
    print(books)
}

Task.detached {
    async let book1 = downloadBook(name: "Harry Potter")
    async let book2 = downloadBook(name: "The Hobbit")
    async let book3 = downloadBook(name: "Catch-22")

    let books = await [book1, book2, book3]
    print(books)
}
