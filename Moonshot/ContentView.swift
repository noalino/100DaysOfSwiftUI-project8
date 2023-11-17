//
//  ContentView.swift
//  Moonshot
//
//  Created by Noalino on 17/11/2023.
//

import SwiftUI

enum Layout {
    case grid, list
}

extension Layout {
    func toggle() -> Self {
        self == .grid ? .list : .grid
    }
}

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var layout = Layout.grid

    var body: some View {
        NavigationStack {
            ScrollView {
                switch layout {
                case .grid:
                    GridView(astronauts: astronauts, missions: missions)
                case .list:
                    ListView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(layout == .grid ? "List" : "Grid") {
                    layout = layout.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
