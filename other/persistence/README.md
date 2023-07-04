# Persistence

### [UserDefaults](https://github.com/brittpinder/ios-reference/tree/main/other/persistence/userdefaults)

A simple way of storing small amounts of data such as user preferences or app settings. UserDefaults stores key-value pairs in a plist within your App's Library folder.

**Pros**

* Very easy to use and requires minimal setup
* Threadsafe

**Cons**

* Not suitable for storing large amounts of data - doing so can lead to performance issues
* It is not a database so it doesn't support advanced operations like querying or indexing
* Data is easily accessible and not encrypted so it's not suitable for storing sensitive data like passwords

<br/>

### [Keychain](https://developer.apple.com/documentation/security/keychain_services)

Allows you to securely store small bits of sensitive data such as passwords, tokens and credit card information within an encrypted database called a keychain.

**Pros**

* High level of security - data is encrypted and protected from unauthorized access
* Data can be shared across different apps from the same developer, allowing seamless sharing of sensitive data between related apps
* Supports biometric authentication (Touch ID or Face ID), adding an extra layer of convenience and security

**Cons**

* Complex - the Keychain Services API has a steep learning curve
* Not suitable for storing large amounts of data

<br/>

### Other Persistence Methods

* [CoreData](https://developer.apple.com/documentation/coredata)
* File System
* [NSCoding](https://developer.apple.com/documentation/foundation/nscoding)
* [Codable](https://developer.apple.com/documentation/swift/codable)
* SQLLite
* Realm
* CloudKit
* [SwiftData](https://developer.apple.com/xcode/swiftdata/)

<br/>

## Links
* [Using CoreData in SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/how-to-combine-core-data-and-swiftui)