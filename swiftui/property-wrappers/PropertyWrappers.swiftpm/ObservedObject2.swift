//
//  ObservedObject2.swift
//  PropertyWrappers
//
//  Created by Brittany Petrova on 2024-06-05.
//

import SwiftUI

class Person2: ObservableObject {
    @Published var name: String
    @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func haveBirthday() {
        age += 1
    }
}

struct ObservedObject2: View {
    @State private var isEnabled = true

    var body: some View {
        BirthdayView()

        Toggle(isOn: $isEnabled, label: {
            Text("Enabled")
        })
        .padding()
    }
}

struct BirthdayView: View {
    @StateObject private var person = Person2(name: "Hermione Granger", age: 13) // Change to @ObservedObject to see problem

    var body: some View {
        PersonView2(person: person)
        Button("Have Birthday") {
            person.haveBirthday()
        }
        .buttonStyle(.borderedProminent)
    }
}

struct PersonView2: View {
    @ObservedObject var person: Person2

    var body: some View {
        Text("Name: \(person.name)")
        Text("Age: \(person.age)")
    }
}

