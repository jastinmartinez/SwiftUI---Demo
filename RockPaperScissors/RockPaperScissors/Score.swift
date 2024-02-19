//
//  Score.swift
//  RockPaperScissors
//
//  Created by Jastin on 19/2/24.
//

import Foundation

class Score {
    
    private(set) var points: Int
    private(set) var rounds: Int
    
    init(points: Int, rounds: Int) {
        self.points = points
        self.rounds = rounds
    }
    
    func add() {
        self.points += 1
        next()
    }
    
    func remove() {
        guard points > 0 else {
            return
        }
        self.points -= 1
        next()
    }
    
    private func next() {
        guard rounds > 0 else {
            return
        }
        rounds -= 1
    }
    
    func reset() {
        self.points = .zero
        self.rounds = 10
    }
    
    static func make() -> Score {
        return Score(points: .zero, rounds: 10)
    }
}
