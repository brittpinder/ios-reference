import UIKit

// Basic Task Group
Task {
    await withTaskGroup(of: Void.self) { group in
        group.addTask {
            print("Task 1")
        }

        group.addTask {
            print("Task 2")
        }

        group.addTask {
            print("Task 3")
        }
    }
}

//Task {
//    print("Starting task group...")
//
//    await withTaskGroup(of: Void.self) { group in
//        group.addTask {
//            print("Task 1 started")
//            try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...3_000_000_000))
//            print("Task 1 finished")
//        }
//
//        group.addTask {
//            print("Task 2 started")
//            try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...3_000_000_000))
//            print("Task 2 finished")
//        }
//
//        group.addTask {
//            print("Task 3 started")
//            try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...3_000_000_000))
//            print("Task 3 finished")
//        }
//    }
//
//    print("Finished task group")
//}

//Task {
//    print("Starting task group...")
//
//    await withTaskGroup(of: Void.self) { group in
//        for i in 1...Int.random(in: 2...5) {
//            group.addTask {
//                print("Task \(i) started")
//                try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...3_000_000_000))
//                print("Task \(i) finished")
//            }
//        }
//    }
//
//    print("Finished task group")
//}

// Returning values from a task group
//func downloadImage(name: String) async -> UIImage {
//    print("Downloading image called \(name)...")
//    try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...3_000_000_000))
//    return UIImage()
//}
//
//Task {
//    let imageNames = ["beach.jpg", "desert.png", "mountain.jpg"]
//
//    let images = await withTaskGroup(of: UIImage.self) { group in
//        for name in imageNames {
//            group.addTask {
//                return await downloadImage(name: name)
//            }
//        }
//
//        var allImages = [UIImage]()
//        for await image in group {
//            allImages.append(image)
//        }
//
//        return allImages
//    }
//
//    print("Successfully downloaded \(images.count) images")
//}


// withThrowingTaskGroup
//enum DownloadError: Error {
//    case failure
//}
//
//func downloadImage(name: String) async throws -> UIImage {
//    print("Downloading image called \(name)...")
//    if Int.random(in: 1...5) == 5 {
//        throw DownloadError.failure
//    }
//    try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...3_000_000_000))
//    return UIImage()
//}
//
//Task {
//    let imageNames = ["beach.jpg", "desert.png", "mountain.jpg"]
//    do {
//        let images = try await withThrowingTaskGroup(of: UIImage.self) { group in
//            for name in imageNames {
//                group.addTask {
//                    return try await downloadImage(name: name)
//                }
//            }
//
//            var allImages = [UIImage]()
//            for try await image in group {
//                allImages.append(image)
//            }
//            return allImages
//        }
//        print("Successfully downloaded \(images.count) images")
//    } catch {
//        print("Error downloading images")
//    }
//}
