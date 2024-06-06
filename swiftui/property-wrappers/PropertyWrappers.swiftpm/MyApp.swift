import SwiftUI

@main
struct MyApp: App {
    @StateObject var settings = Settings(notifications: true, accentColor: .blue)

    var body: some Scene {
        WindowGroup {
            State1()
//            StateObject2(score: 3)
//            EnvironmentObject1()
//                .environmentObject(settings)
        }
    }
}
