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


