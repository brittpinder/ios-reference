//
//  Environment1.swift
//  PropertyWrappers
//
//  Created by Brittany Petrova on 2024-06-07.
//

import SwiftUI

struct Environment1: View {
    var body: some View {
        CircleView()
        CircleView()
            .environment(\.colorScheme, .dark)
    }
}

struct CircleView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Circle()
            .frame(width: 250, height: 250)
            .foregroundStyle(colorScheme == .dark ? .blue : .red)
    }
}
