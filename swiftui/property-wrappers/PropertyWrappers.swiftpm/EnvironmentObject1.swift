//
//  EnvironmentObject1.swift
//  PropertyWrappers
//
//  Created by Brittany Petrova on 2024-06-06.
//

import SwiftUI

class Settings: ObservableObject {
    @Published var notifications: Bool
    @Published var accentColor: Color

    init(notifications: Bool, accentColor: Color) {
        self.notifications = notifications
        self.accentColor = accentColor
    }
}

struct EnvironmentObject1: View {
    var body: some View {
        ChildView()
    }
}

struct ChildView: View {
    @EnvironmentObject var settings: Settings

    var body: some View {
        Text("Child View")
            .foregroundStyle(settings.accentColor)
        Button("Change Color") {
            if let newColor = [Color.red, Color.green, Color.blue, Color.purple, Color.orange].randomElement() {
                settings.accentColor = newColor
            }
        }
        .buttonStyle(.borderedProminent)
    }
}
