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