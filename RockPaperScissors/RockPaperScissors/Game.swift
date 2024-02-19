//
//  Game.swift
//  RockPaperScissors
//
//  Created by Jastin on 19/2/24.
//

import Foundation

struct Game {
    
    private let score: Score
    
    init(score: Score = Score.make()) {
        self.score = score
    }
    
    var points: Int {
        return score.points
    }
    
    var rounds: Int {
        return score.rounds
    }
    
    func pickCard(first: Card, second: Card) -> GameResult {
        if first == .paper && second == .rock {
            return .match
        } else if first == .scissors && second == .paper {
            return .match
        }  else if first == .rock && second == .scissors {
            return .match
        } else if first == second {
            return .equal
        } else {
            return .fail
        }
    }
    
    func addPoint() {
        self.score.add()
    }
    
    func removePoint() {
        self.score.remove()
    }
    
    func reset() {
        self.score.reset()
    }
}
