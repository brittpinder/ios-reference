//
//  Binding1.swift
//  PropertyWrappers
//
//  Created by Brittany Petrova on 2024-05-31.
//

import SwiftUI

struct Binding1: View {
    @State var number: Int = 1

    var body: some View {
        Text("\(number)")
        RollButton(number: $number)
    }
}

struct RollButton: View {
    @Binding var number: Int

    var body: some View {
        Button("Roll") {
            number = Int.random(in: 1...6)
        }
        .buttonStyle(.borderedProminent)
    }
}
