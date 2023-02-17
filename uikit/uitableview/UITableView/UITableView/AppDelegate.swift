//
//  AppDelegate.swift
//  UITableView
//
//  Created by Brittany Pinder on 2023-02-07.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var basicTableVC = BasicTableVC()
    var cellAccessoryVC = CellAccessoryVC()
    var customCellVC = CustomCellVC()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = customCellVC

        return true
    }

}

