//
//  AppDelegate.swift
//  ViewController
//
//  Created by Brittany Pinder on 2023-03-02.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground

        let navigationController = UINavigationController()
        let mainViewController = MainViewController()
        navigationController.viewControllers = [mainViewController]

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

}

