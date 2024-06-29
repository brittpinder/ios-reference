//
//  BasicTask.swift
//  Tasks
//
//  Created by Brittany Petrova on 2024-06-29.
//

import SwiftUI

struct BasicTask: View {
    @State private var temperature: Int = 0

    var body: some View {
        VStack {
            Text("\(temperature)°")
                .font(.title)
        }
//        .task {
//            await fetchTemperature()
//        }
        .onAppear {
            Task {
                await fetchTemperature()
            }
        }
    }

    func fetchTemperature() async {
        sleep(2)
        temperature = Int.random(in: -20...30)
    }
}

#Preview {
    BasicTask()
}
