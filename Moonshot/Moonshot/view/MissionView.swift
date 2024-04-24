//
//  MissionView.swift
//  Moonshot
//
//  Created by Jastin on 22/4/24.
//

import Foundation
import SwiftUI


struct MissionView: View {
    
    let mission: Mission
    private let crews: [Crew]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        let crewNames = mission.crew.map({ $0.name })
        self.crews = astronauts
            .filter({ crewNames.contains($0.key) })
            .map({ Crew(role: $0.key, astronaut: $0.value)})
        
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal)  { width, axis in
                        return width * 0.6
                    }
                
                VStack(alignment: .leading) {
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Missions Highlights")
                        .font((.title.bold()))
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crews, id: \.role) { crew in
                            NavigationLink {
                                AstronautView(astronaut: crew.astronaut)
                            } label: {
                                HStack {
                                    Image(crew.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(.capsule)
                                        .overlay {
                                            Capsule()
                                                .strokeBorder(.white, lineWidth: 1)
                                        }
                                    VStack(alignment: .leading) {
                                        Text(crew.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        
                                        Text(crew.role)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                }
                                .padding(.horizontal)
                            }
            
                        }
                    }
                }
                
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

extension MissionView {
    private struct Crew {
        let role: String
        let astronaut: Astronaut
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts")
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
