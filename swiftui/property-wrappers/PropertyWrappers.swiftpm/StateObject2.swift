//
//  StateObject2.swift
//  PropertyWrappers
//
//  Created by Brittany Petrova on 2024-06-04.
//

import SwiftUI

class Game2: ObservableObject {
    @Published var score: Int

    init(score: Int) {
        self.score = score
    }
}

struct StateObject2: View {
    @StateObject private var game: Game2

    init(score: Int) {
        _game = StateObject(wrappedValue: Game2(score: score))
    }

    var body: some View {
        Text("Score: \(game.score)")
        Button("Increase Score") {
            game.score += 1
            print("\(game.score)")
        }
    }
}
