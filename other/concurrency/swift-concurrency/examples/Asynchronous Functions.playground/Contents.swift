import UIKit

func fetchTemperature() async -> Int {
    return Int.random(in: -20...30)
}

Task.detached {
    let temperature = await fetchTemperature()
    print(temperature)
}
