//
//  Missions.swift
//  Moonshot
//
//  Created by Jastin on 22/4/24.
//

import Foundation


struct Mission: Identifiable, Decodable {
    let id: Int
    let launchDate: Date?
    let crew: [Crew]
    let description: String
    
    struct Crew: Decodable {
        let name: String
        let role: String
    }
    
    var displayName: String {
        return "Apollo \(id)"
    }
    
    var image: String {
        return "apollo\(id)"
    }
    
    var displayLaunchDate: String {
        return launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
