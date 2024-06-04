//
//  StateObject1.swift
//  PropertyWrappers
//
//  Created by Brittany Petrova on 2024-06-04.
//

import SwiftUI

class Game: ObservableObject {
    @Published var score: Int = 0
}

struct StateObject1: View {
    @StateObject private var game = Game()

    var body: some View {
        Text("Score: \(game.score)")
        Button("Increase Score") {
            game.score += 1
            print("\(game.score)")
        }
    }
}
