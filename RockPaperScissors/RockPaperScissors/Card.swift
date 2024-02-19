//
//  Card.swift
//  RockPaperScissors
//
//  Created by Jastin on 19/2/24.
//

import Foundation

enum Card: Int, CaseIterable {
    case rock
    case paper
    case scissors
}

extension Card {
    var description: String {
        switch self {
        case .rock:
            return "Rock"
        case .paper:
            return "Paper"
        case .scissors:
            return "Scissors"
        }
    }
    
    var icon: String {
        switch self {
        case .rock:
            return "rock"
        case .paper:
            return "paper"
        case .scissors:
            return "scissors"
        }
    }
    
    static func list() -> [Card] {
        return Card.allCases.shuffled()
    }
    
    static func random() -> Card {
        return Card.allCases[Int.random(in: 0..<Card.allCases.count)]
    }
}
