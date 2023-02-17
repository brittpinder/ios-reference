//
//  AppDelegate.swift
//  StackView
//
//  Created by Brittany Pinder on 2023-02-16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let axisSpacingVC = AxisSpacingVC()
    let distributionAlignmentVC = DistributionAlignmentVC()

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = distributionAlignmentVC

        return true
    }

}

