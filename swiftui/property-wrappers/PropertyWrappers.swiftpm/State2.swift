import SwiftUI

struct State2: View {

    @State private var name: String = ""

    var body: some View {
        TextField("Name", text: $name)
            .multilineTextAlignment(.center)

        Text("\(name)")
            .font(.title)
    }
}
