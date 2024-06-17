//
//  NetworkService.swift
//  NetworkingSwiftUI
//
//  Created by Brittany Petrova on 2024-06-15.
//

import Foundation

class NetworkService {
    func fetchJoke(completion: @escaping (Result<Joke, JokeError>) -> Void) {
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
            completion(Result.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(Result.failure(.networkError))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(Result.failure(.badResponse))
                return
            }

            guard let data = data else {
                completion(Result.failure(.noDataReceived))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(Joke.self, from: data)
                completion(Result.success(decodedData))
            } catch {
                completion(Result.failure(.decodingError))
                return
            }
        }

        task.resume()
    }

    func fetchJokeAsync() async throws -> Joke {
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
            throw JokeError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw JokeError.badResponse
        }

        do {
            return try JSONDecoder().decode(Joke.self, from: data)
        } catch {
            throw JokeError.decodingError
        }
    }
}
