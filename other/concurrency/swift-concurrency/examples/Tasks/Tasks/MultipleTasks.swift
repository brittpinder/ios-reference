//
//  MultipleTasks.swift
//  Tasks
//
//  Created by Brittany Petrova on 2024-06-29.
//

import SwiftUI

struct MultipleTasks: View {
    var body: some View {
        Button("Download Albums") {
            Task {
                await downloadAlbum(name: "folklore")
            }

            Task {
                await downloadAlbum(name: "reputation")
            }

            Task {
                await downloadAlbum(name: "1989")
            }
        }
    }

    func downloadAlbum(name: String) async {
        print("Downloading \(name)...")
        try? await Task.sleep(nanoseconds: UInt64(Int.random(in: 1_000_000_000...3_000_000_000)))
        print("Finished downloading \(name)")
    }
}

#Preview {
    MultipleTasks()
}
