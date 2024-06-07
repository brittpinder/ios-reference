# [Observation](https://developer.apple.com/documentation/Observation)

Introduced in iOS17, the Observation framework is a Swift-specific implementation of the observer design pattern. It replaces all uses of Observable Objects (`@StateObject`, `@ObservedObject`, `@EnvironmentObject`) with the `@Observable` macro. As well as a cleaner syntax, it is more performant than using Observable Objects. This framework is only available in iOS17 so unless your app is targeted towards iOS17 and above, you will need to keep using Observable Objects.

<br/>

## Links

- [Migrating from the Observable Object protocol to the Observable macro](https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro)
- [How to use @ObservableMacro in SwiftUI (video)](https://www.youtube.com/watch?v=hLkTMJ_SFzY)