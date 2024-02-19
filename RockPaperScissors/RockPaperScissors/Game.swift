//
//  Game.swift
//  RockPaperScissors
//
//  Created by Jastin on 19/2/24.
//

import Foundation

enum Game {
    static func pick(first: Card, second: Card) -> GameResult {
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
}
