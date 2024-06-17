//
//  Example3.swift
//  NetworkingSwiftUI
//
//  Created by Brittany Petrova on 2024-06-14.
//

import SwiftUI

struct Example3: View {
    @State private var joke: Joke?
    private var networkService = NetworkService()

    var body: some View {
        VStack(spacing: 20) {
            if let joke {
                Text(joke.setup)
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text(joke.punchline)
            }
            Button("Tell me a joke") {
                Task {
                    do {
                        joke = try await networkService.fetchJokeAsync()
                    } catch {
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding()
        }
        .padding()
    }
}

#Preview {
    Example3()
}


