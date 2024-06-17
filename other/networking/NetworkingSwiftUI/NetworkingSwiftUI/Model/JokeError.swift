//
//  JokeError.swift
//  NetworkingSwiftUI
//
//  Created by Brittany Petrova on 2024-06-15.
//

import Foundation

enum JokeError: String, Error {
    case invalidURL = "Failed to create URL"
    case networkError = "Network request failed"
    case badResponse = "Bad response received from the server"
    case noDataReceived = "Failed to retreive data"
    case decodingError = "Failed to decode data"
}
