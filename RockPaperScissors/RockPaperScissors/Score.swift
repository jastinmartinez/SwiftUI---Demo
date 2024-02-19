//
//  Score.swift
//  RockPaperScissors
//
//  Created by Jastin on 19/2/24.
//

import Foundation

class Score: ObservableObject {
    
    private(set) var points: Int
    @Published  private(set) var rounds: Int
    
    init(points: Int, rounds: Int) {
        self.points = points
        self.rounds = rounds
    }
    
    func add() {
        self.points += 1
        next()
    }
    
    func remove() {
        next()
        guard points > 0 else {
            return
        }
        self.points -= 1
    }
    
    func next() {
        guard rounds < 10 else {
            reset()
            return
        }
        rounds += 1
    }
    
    func reset() {
        self.points = .zero
        self.rounds = 1
    }
    
    static func make() -> Score {
        return Score(points: .zero, rounds: 1)
    }
}
