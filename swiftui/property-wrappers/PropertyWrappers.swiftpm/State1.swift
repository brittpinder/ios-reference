import SwiftUI

struct State1: View {

    @State private var number: Int = 1

    var body: some View {
        VStack {
            Text("\(number)")
            Button("Roll") {
                number = Int.random(in: 1...6)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
