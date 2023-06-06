//
//  AppDelegate.swift
//  AppLifeCycle
//
//  Created by Brittany Pinder on 2023-06-06.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("willFinishLaunchingWithOptions")
        print(UIApplication.shared.applicationState.getDisplayString())
        print("\n")
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("didFinishLaunchingWithOptions")
        print(UIApplication.shared.applicationState.getDisplayString())
        print("\n")
        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("willEnterForeground")
        print(UIApplication.shared.applicationState.getDisplayString())
        print("\n")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("didBecomeActive")
        print(UIApplication.shared.applicationState.getDisplayString())
        print("\n")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("didEnterBackground")
        print(UIApplication.shared.applicationState.getDisplayString())
        print("\n")
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("willResignActive")
        print(UIApplication.shared.applicationState.getDisplayString())
        print("\n")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("willTerminate")
        print(UIApplication.shared.applicationState.getDisplayString())
        print("\n")
    }
}
