//
//  Joke.swift
//  NetworkingSwiftUI
//
//  Created by Brittany Petrova on 2024-06-14.
//

import Foundation

// 1. Define a model
struct Joke: Decodable {
    let setup: String
    let punchline: String
}
