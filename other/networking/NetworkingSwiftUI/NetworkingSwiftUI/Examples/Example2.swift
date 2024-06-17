//
//  Example2.swift
//  NetworkingSwiftUI
//
//  Created by Brittany Petrova on 2024-06-14.
//

import SwiftUI

class JokeFetcher: ObservableObject {
    @Published var joke: Joke?
    private var networkService = NetworkService()

    func fetchJoke() {
        networkService.fetchJoke { [weak self] result in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async {
                    self?.joke = joke
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}

struct Example2: View {
    @StateObject var jokeFetcher = JokeFetcher()

    var body: some View {
        VStack(spacing: 20) {
            if let joke = jokeFetcher.joke {
                Text(joke.setup)
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text(joke.punchline)
            }
            Button("Tell me a joke") {
                jokeFetcher.fetchJoke()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding()
        }
        .padding()
    }
}

#Preview {
    Example2()
}


