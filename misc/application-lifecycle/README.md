# [iOS Application Life Cycle](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle)

The iOS application life cycle is different depending on whether or not an app supports scenes:

* In iOS 12 and earlier, or in apps that choose not to support scenes, [UIApplicationDelegate](https://developer.apple.com/documentation/uikit/uiapplicationdelegate) is used to respond to life cycle events.
* If an app is running on iOS 13 or later and has chosen to support scenes, [UISceneDelegate](https://developer.apple.com/documentation/uikit/uiscenedelegate) is used to respond to life cycle events.

<br/>

## [App-Based Life Cycle](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle#2928645)

An iOS app can be in one of five states: Active, Inactive, Background, Suspended or Not Running.

#### Active

The app is running in the foreground, receiving events and actively being used.


#### Inactive

The app is running in the foreground but is not receiving any events (it may be executing code though). This is generally a brief transition state between the 'Active' state and the 'Background' state. The app is in an 'Inactive' state when it is about to enter the active state (opening or switching to an app) or leave the active state (closing or leaving an app). This state is also entered whenever there is a system interruption such as an incoming phone call or an emergency alert. An app in the inactive state should do minimal work while it waits to transition to either the active or background state.


#### Background

The app is running in the background and cannot receive any events. It can execute code but may have limited resources. An app will enter the background state whenever a user switches to another application. An app can remain in this state if it has requested extra execution time (ex: finishing a network request, saving data) or if it is performing a background task such as playing audio (ex: Spotify) or updating location information (ex: Google Maps). Otherwise, it will move into the 'Suspended' state.


#### Suspended

The app is loaded in memory making it easier to transition back to an active state if needed, but it cannot execute code or receive events, preserving battery life. If the system needs to free up memory, it will terminate suspended applications and won't notify them before doing so.


#### Not Running

The app is not running or loaded in memory, meaning that it cannot execute code and does not take up any resources. An application is in this state if it has yet to be launched or if it has been terminated by the user or the system.

<br/>

**State** | **Running Location** | **Loaded In Memory** | **Can Execute Code** | **Can Receive Events**
---|---|---|---|---
**Active** | Foreground | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark:
**Inactive** | Foreground | :heavy_check_mark: | :heavy_check_mark: |
**Background** | Background | :heavy_check_mark: | :heavy_check_mark: |
**Suspended** | N/A | :heavy_check_mark: | |
**Not Running** | N/A | | |

<br/>

> Note: While an application is running, its state can be accessed through [`UIApplication.shared.applicationState`](https://developer.apple.com/documentation/uikit/uiapplication/1623003-applicationstate). This variable holds one of three enum values: `active`, `inactive` or `background`.

<br/>

### State Transitions

The following diagrams show the state transitions that occur during an app's life cycle. After launch, the system puts the app in the inactive or background state, depending on whether the UI is about to appear onscreen. When launching to the foreground, the system transitions the app to the active state automatically. After that, the state fluctuates between active and background (transitioning through inactive) until the app terminates.

![](images/0.png) | ![](images/1.png)
---|---

<br/>

### Responding to Life Cycle Events

In order to respond to life cycle events, you can use various app delegate methods:

#### App Initialization

##### [`application(_:willFinishLaunchingWithOptions:)`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623032-application)

This method is called after your app has been launched and its main storyboard or nib file has been loaded, but before your app’s state has been restored. At the time this method is called, your app is in the inactive state. Use this method along with `application(_:didFinishLaunchingWithOptions:)` to initialize your app and prepare it to run.

##### [`application(_:didFinishLaunchingWithOptions:)`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622921-application)

This method is called after state restoration has occurred but before your app’s window and other UI have been presented. At the time this method is called, your app is in the inactive state. Use this method along with `application(_:willFinishLaunchingWithOptions:)` to initialize your app and prepare it to run.

<br/>

#### Transitioning to Foreground

##### [`applicationWillEnterForeground`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623076-applicationwillenterforeground)

This method is called right when the app is about to transition from the background to the active state (passing through the inactive state). Use this method to undo many of the changes you made to your app upon entering the background. This method is followed by a call to `applicationDidBecomeActive`.

##### [`applicationDidBecomeActive`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622956-applicationdidbecomeactive)

This method is called right after the app has transitioned from the inactive to the active state. The app moves to the active state if it was launched by the user or the system, or if the user ignores an interruption (like an incoming phone call) that sent the app temporarily to the inactive state. Use this method to restart any tasks that were paused (or not yet started) while the app was inactive. For example, use it to restart timers or throttle up OpenGL ES frame rates. If your app was previously in the background, you can also use it to refresh your app’s user interface.

See also: [Preparing your UI to run in the foreground](https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_foreground)

<br/>

#### Transitioning to Background

##### [`applicationWillResignActive`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622950-applicationwillresignactive)

This method is called when an app is about to move from the active to the inactive state (due to an interruption such as a phone call or the user exiting the app). Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game. If your app has unsaved user data, you can save it to ensure that it isn’t lost. However, it is recommended that you save user data at appropriate points throughout the execution of your app and to not rely on specific app state transitions to save all of your app’s critical data.

##### [`applicationDidEnterBackground`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622997-applicationdidenterbackground)

This method is called right after an app transitions to the background state. Use this method to release shared resources, invalidate timers, and store enough app state information to restore your app to its current state in case it's terminated later. You must return from this method as quickly as possible as it has approximately five seconds to execute any tasks before the app will be terminated and purged from memory. If you need additional time to perform any final tasks, request additional execution time from the system by calling [`beginBackgroundTask(expirationHandler:)`](https://developer.apple.com/documentation/uikit/uiapplication/1623031-beginbackgroundtask).

See also: [Preparing your UI to run in the background](https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_background)

<br/>

#### Termination

##### [`applicationWillTerminate`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623111-applicationwillterminate)

This method is called when an app is about to be terminated and purged from memory. Use this method to perform any final clean-up tasks for your app, such as freeing shared resources, saving user data, and invalidating timers. Your implementation of this method has approximately five seconds to perform any tasks and return. If the method does not return before time expires, the system may terminate the process altogether.

<br/>

## Links

* [Managing your app's lifecycle](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle)
* [iOS App Life Cycle](https://medium.com/@boredbanana/ios-app-life-cycle-ec1b31cee9dc)
* [Execution States for a Swift iOS App](https://www.codingexplorer.com/execution-states-swift-ios-app/)
* [How to Remove SceneDelegate](https://stackoverflow.com/questions/59006550/how-to-remove-scene-delegate-from-ios-application)