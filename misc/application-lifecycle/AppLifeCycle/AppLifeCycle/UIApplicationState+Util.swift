//
//  UIApplicationState+Util.swift
//  AppLifeCycle
//
//  Created by Brittany Pinder on 2023-06-06.
//

import UIKit

extension UIApplication.State {
    func getDisplayString() -> String {
        switch self {
        case .active: return "Active"
        case .inactive: return "Inactive"
        case .background: return "Background"
        }
    }
}
