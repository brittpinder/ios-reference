# [UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults)

<br/>

## Writing to UserDefaults

Key/value pairs can be written to UserDefaults by using the [`set(_ :forKey:)`](https://developer.apple.com/documentation/foundation/userdefaults/1414067-set) method:

```swift
defaults.set(25, forKey: "Age")
defaults.set("Emily", forKey: "Name")
defaults.set(true, forKey: "DarkMode")
defaults.set(Date(), forKey: "LastRun")

let genres = ["Mystery", "Historical Fiction", "Sci-Fi"]
defaults.set(genres, forKey: "Genres")

let ratings = ["Harry Potter": 5, "The Great Gatsby": 3]
defaults.set(ratings, forKey: "Ratings")
```

<br/>

## Reading from UserDefaults

When reading values from UserDefaults, you need to use the function that corresponds with the type of the value you are reading:

```swift
let age = defaults.integer(forKey: "Age")
let name = defaults.string(forKey: "Name") ?? ""
let darkMode = defaults.bool(forKey: "DarkMode")
let lastRun = defaults.object(forKey: "LastRun") as? Date ?? Date()
let genres = defaults.array(forKey: "Genres") as? [String] ?? [String]()
let ratings = defaults.dictionary(forKey: "Ratings") as? [String:Int] ?? [String:Int]()
```

It is important to note that if you attempt to get the value of a key that doesn't exist, a default value will be returned. For example, if we tried to retrieve the "Age" key using "age" instead, we would get a value of 0 instead of 25:

```swift
let wrongAge = defaults.integer(forKey: "age")
print(wrongAge) // 0
```
Because of this, it is good practice to use constants instead of raw strings when writing to and reading from UserDefaults:

```swift
// Somewhere else in your app
struct Keys {
    static let age = "Age"
}

defaults.set(25, forKey: Keys.age)

let correctAge = defaults.integer(forKey: Keys.age)
print(correctAge) // 25
```

<br/>

## Removing Values from UserDefaults

In order to remove a key/value pair from UserDefaults, use the [`removeObject(forKey:)`](https://developer.apple.com/documentation/foundation/userdefaults/1411182-removeobject) method, passing in the key you would like to remove:

```swift
defaults.removeObject(forKey: "Age")
```

<br/>

### Resetting UserDefaults

If you want to remove all key/value pairs from UserDefaults, use the [`removePersistentDomain(forName:)`](https://developer.apple.com/documentation/foundation/userdefaults/1417339-removepersistentdomain) method, passing in the bundle id:

```swift
if let bundleID = Bundle.main.bundleIdentifier {
    defaults.removePersistentDomain(forName: bundleID)
}
```

<br/>

## Manually Accessing the UserDefaults plist

In order to find the path to the UserDefaults plist, add the following line to the `didFinishLaunchingWithOptions` method in the AppDelegate:

```swift
print(NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first! as String)
```
When you run the app (on a simulator), a file path will be printed that looks something like this:

```
/Users/brittanypinder/Library/Developer/CoreSimulator/Devices/6BC44775-22B0-478D-8F0B-192D9E15EF87/data/Containers/Data/Application/53BBC363-B066-43A3-8667-8D5F834AB4FD/Library
```
If you go into this path, there will be a folder called "Preferences". Inside that folder is your UserDefaults plist which you can open, view and edit.

![](images/0.png)

<br/>

## Links

* [UserDefaults Video Tutorial](https://www.youtube.com/watch?v=HxVOahmfwz0&ab_channel=PaulHudson)