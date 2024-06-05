//
//  ObservedObject2.swift
//  PropertyWrappers
//
//  Created by Brittany Petrova on 2024-06-05.
//

import SwiftUI

class Person: ObservableObject {
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

struct ObservedObject1: View {
    @StateObject private var person = Person(name: "Hermione Granger", age: 13)

    var body: some View {
        PersonView(person: person)
        Button("Have Birthday") {
            person.haveBirthday()
        }
        .buttonStyle(.borderedProminent)
    }
}

struct PersonView: View {
    @ObservedObject var person: Person

    var body: some View {
        Text("Name: \(person.name)")
        Text("Age: \(person.age)")
    }
}
