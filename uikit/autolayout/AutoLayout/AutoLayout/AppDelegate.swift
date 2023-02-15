//
//  AppDelegate.swift
//  AutoLayout
//
//  Created by Brittany Pinder on 2023-02-15.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let frameVC = FrameVC()
    let centerVC = CenterVC()
    let cornersVC = CornersVC()

    let equalToVC = EqualToVC()
    let equalToConstantVC = EqualToConstantVC()
    let equalToMultiplierVC = EqualToMultiplierVC()
    let equalToMultiplierConstantVC = EqualToMultiplierConstantVC()

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = equalToMultiplierConstantVC

        return true
    }

}

