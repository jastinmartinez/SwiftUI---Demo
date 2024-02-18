//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by Jastin on 18/2/24.
//

import XCTest

enum GameResult {
    case win
    case lose
}

enum Card: Int {
    case rock
    case paper
    case scissors
}

class Score {
    private(set) var points: Int = .zero
    private(set) var rounds: Int = 10
    
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
}

struct Game {
    
    private let score: Score = Score()
    
    var points: Int {
        return score.points
    }
    
    var rounds: Int {
        return score.rounds
    }
    
    func pickCard(first: Card, second: Card) -> GameResult {
        if first == .paper && second == .rock {
            return .win
        } else if first == .scissors && second == .paper {
            return .win
        }  else if first == .rock && second == .scissors {
            return .win
        } else {
            return .lose
        }
    }
    
    func addPoint() {
        self.score.add()
    }
    
    func removePoint() {
        self.score.remove()
    }
    
     
}

final class RockPaperScissorsTests: XCTestCase {
    
    func test_init_game_scoreIsZero() {
        let sut = Game()
        
        XCTAssertEqual(sut.points, .zero)
    }
    
    func test_init_game_defaultRoundIsTen() {
        let sut = Game()
        
    }
    
    
    func test_pick_firsIsPaper_secondIsRock_resultIsWin() {
        let sut = Game()
        
        let result = sut.pickCard(first: .paper, second: .rock)
        
        XCTAssertEqual(result, .win)
    }
    
    func test_pick_firsIsScissor_secondIsPaper_resultIsLose() {
        let sut = Game()
        
        let result = sut.pickCard(first: .scissors, second: .paper)
        
        XCTAssertEqual(result, .win)
    }
    
    func test_pick_firsIsRock_secondIsScissor_resultIsWine() {
        let sut = Game()
        
        let result = sut.pickCard(first: .rock, second: .scissors)
        
        XCTAssertEqual(result, .win)
    }
    
    func test_pick_firsIsRock_secondIsPaper_resultIsWine() {
        let sut = Game()
        
        let result = sut.pickCard(first: .rock, second: .paper)
        
        XCTAssertEqual(result, .lose)
    }
    
    func test_pick_firsIsPaper_secondIsScissor_resultIsLose() {
        let sut = Game()
        
        let result = sut.pickCard(first: .paper, second: .scissors)
        
        XCTAssertEqual(result, .lose)
    }
    
    func test_pick_firsIsScissor_secondIsRock_resultIsWine() {
        let sut = Game()
        
        let result = sut.pickCard(first: .scissors, second: .rock)
        
        XCTAssertEqual(result, .lose)
    }
    
    func test_pickCard_winResult_addPoint() {
        var sut = Game()
        
        let result = sut.pickCard(first: .paper, second: .rock)
        if case result = .win {
            sut.addPoint()
        }
        
        XCTAssertEqual(sut.points, 1)
    }
    
    func test_pickCard_loseResult_removePoint() {
        var sut = Game()
        
        if case sut.pickCard(first: .paper, second: .rock) = .win {
            sut.addPoint()
        }
        
        if case sut.pickCard(first: .scissors, second: .rock) = .lose {
            sut.removePoint()
        }
        
        XCTAssertEqual(sut.points, 0)
    }
}
