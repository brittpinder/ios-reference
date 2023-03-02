# [UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller)

## View Controller Lifecycle

There are five main view controller lifecycle methods that are called automatically at various points throughout a view controller's lifetime. You can override these methods to add custom functionality at these points in time, but you must call `super` at some point in your implementation. All of these methods are called no matter if the view controller is created programmatically or from a nib file.

#### [`viewDidLoad`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621495-viewdidload)

* Called after the controller's view is loaded into memory
* This method is only called once, when the view is first created
* Use this method to perform additional initialization

#### [`viewWillAppear`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621510-viewwillappear)

* Called right before the view controller's view is added to a view hierarchy
* Use this method to perform custom tasks associated with displaying the view like changing the style of the status bar to coordinate with the style of the view being presented


#### [`viewDidAppear`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621423-viewdidappear)

* Called right after the view controller's view is added to a view hierarchy
* Use this method to perform any tasks that should start when the user first sees the view controller (like playing an animation or starting a timer)

> Note: It is important to note that these methods `viewWillAppear` and `viewDidAppear` will still be called even if the view controller isn't necessarily visible on the screen (due to it being blocked by another component or `view.isHidden` being set to true). Despite the naming, it's not about whether the view is actually visible on screen, it's about whether or not it's in the view hierarchy.

#### [`viewWillDisappear`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621485-viewwilldisappear)

* Called right before the view controller's view is removed from a view hierarchy
* Use this method to do things like save changes, stop animations or revert alterations to the UI that were made in `viewWillAppear`


#### [`viewDidDisappear`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621477-viewdiddisappear)

* Called right after the view controller's view is removed from a view hierarchy
* Use this method to perform additional tasks associated with dismissing or hiding the view
* Note: The view still exists in memory at this point, it’s just not visible to the user

<br/>

## Other View-Related Events

#### [`viewWillLayoutSubviews`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621437-viewwilllayoutsubviews)

* This method is called when the view controller's view's bounds change, but *before* it lays out its subviews
* The default implementation of this methods does nothing so you do not need to call `super` if you override this method

#### [`viewDidLayoutSubviews`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621398-viewdidlayoutsubviews)

* Called when the view controller's view's bounds change, but *after* it has finished laying out its subviews
* The default implementation of this methods does nothing so you do not need to call `super` if you override this method

> Note: Whenever a view's bounds change (ex: by rotating from portrait to landscape), the view adjusts the position of its subviews. This is what is referred to by "LayoutSubviews" in the `viewWillLayoutSubviews` and `viewDidLayoutSubviews` methods.

<br/>

## Links
* [Showing and Hiding View Controllers](https://developer.apple.com/documentation/uikit/view_controllers/showing_and_hiding_view_controllers)
* [View Controller Rotations](https://developer.apple.com/documentation/uikit/uiviewcontroller#1652814)
* [ViewController Lifecycle Video](https://www.youtube.com/watch?v=d7ZqxvbiTyg&ab_channel=SeanAllen)