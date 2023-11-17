//
//  GridView.swift
//  Moonshot
//
//  Created by Noalino on 17/11/2023.
//

import SwiftUI

struct GridView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()

                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)

                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
        }
        .navigationDestination(for: Mission.self) { mission in
            MissionView(mission: mission, astronauts: astronauts)
        }
        .padding([.horizontal, .bottom])
    }
}

//#Preview {
//    GridView()
//}
