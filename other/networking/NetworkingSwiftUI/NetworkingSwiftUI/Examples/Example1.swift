//
//  Example1.swift
//  NetworkingSwiftUI
//
//  Created by Brittany Petrova on 2024-06-14.
//

import SwiftUI

struct Example1: View {
    @State private var joke: Joke?

    var body: some View {
        VStack(spacing: 20) {
            if let joke {
                Text(joke.setup)
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text(joke.punchline)
            }
            Button("Tell me a joke") {
                fetchJoke()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding()
        }
        .padding()
    }

    func fetchJoke() {
        // 2. Create a URL
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
            print("Failed to create URL!")
            return
        }

        // 3. Create and configure a URLRequest (optional - you can also just pass url directly to URLSession.shared.dataTask)
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // 5. Handle the response
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid response")
                return
            }

            guard let data = data else {
                print("Error retrieving data!")
                return
            }

            // 6. Decode the data
            do {
                let decodedData = try JSONDecoder().decode(Joke.self, from: data)
                DispatchQueue.main.async {
                    self.joke = decodedData
                }
            } catch {
                print("Error decoding response: \(error.localizedDescription)")
                return
            }
        }

        // 4. Execute the Network Call
        task.resume()
    }
}

#Preview {
    Example1()
}


