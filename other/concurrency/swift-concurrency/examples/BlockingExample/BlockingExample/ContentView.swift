//
//  ContentView.swift
//  BlockingExample
//
//  Created by Brittany Petrova on 2024-06-27.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature = 0
    @State private var count = 0

    var body: some View {
        VStack {
            Text("\(temperature)°")
                .font(.title)

            Button("Check Weather") {
                Task {
                    temperature = await fetchTemperature()
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)

            Text("\(count)")
                .font(.title)
                .padding(.top, 32)
            Button("Increment") {
                count += 1
            }
            .tint(.green)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
    }

    func fetchTemperature() async -> Int {
        sleep(3)
        return Int.random(in: -20...30)
    }
}

#Preview {
    ContentView()
}
