//
//  TaskCancellation.swift
//  Tasks
//
//  Created by Brittany Petrova on 2024-07-02.
//

import SwiftUI

struct TaskCancellation: View {
    @State private var task: Task<Void, Error>?

    var body: some View {
        HStack {
            Button("Download File") {
                downloadFile()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)

            Button("Cancel") {
                cancelDownload()
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
        }
    }

    func cancelDownload() {
        task?.cancel()
    }

    func downloadFile() {
        task = Task {
            for i in 1...100 {
                usleep(50_000)
                print("\(i)%")
            }
        }
    }

    func downloadFile1() {
        task = Task {
            do {
                for i in 1...100 {
                    try Task.checkCancellation()
                    usleep(50_000)
                    print("\(i)%")
                }
            } catch is CancellationError {
                print("Task was cancelled")
            }
        }
    }

    func downloadFile2() {
        task = Task {
            for i in 1...100 {
                if Task.isCancelled {
                    print("Performing cleanup")
                    return
                }
                usleep(50_000)
                print("\(i)%")
            }
        }
    }

    func downloadFile3() {
        task = Task {
            for i in 1...100 {
                try await Task.sleep(nanoseconds: 50_000_000)
                print("\(i)%")
            }
        }
    }
}

#Preview {
    TaskCancellation()
}
