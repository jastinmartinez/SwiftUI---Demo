//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by Jastin on 18/2/24.
//

import XCTest
@testable import RockPaperScissors



final class RockPaperScissorsTests: XCTestCase {
    
    func test_init_score_scoreIsZero() {
        let sut = Score.make()
        
        XCTAssertEqual(sut.points, .zero)
    }
    
    func test_init_score_defaultRoundIsOne() {
        let sut = Score.make()
        
        XCTAssertEqual(sut.rounds, 1)
    }
    
    func test_pick_firsIsPaper_secondIsRock_resultIsMatch() {
        let result = Game.pick(first: .paper, second: .rock)
        
        XCTAssertEqual(result, .match)
    }
    
    func test_pick_firsIsScissor_secondIsPaper_resultIsFail() {
        let result = Game.pick(first: .scissors, second: .paper)
        
        XCTAssertEqual(result, .match)
    }
    
    func test_pick_firsIsRock_secondIsScissor_resultIsMatch() {
        let result = Game.pick(first: .rock, second: .scissors)
        
        XCTAssertEqual(result, .match)
    }
    
    func test_pick_firsIsRock_secondIsPaper_resultIsMatch() {
        
        let result = Game.pick(first: .rock, second: .paper)
        
        XCTAssertEqual(result, .fail)
    }
    
    func test_pick_firsIsPaper_secondIsScissor_resultIsFail() {
        let result = Game.pick(first: .paper, second: .scissors)
        
        XCTAssertEqual(result, .fail)
    }
    
    func test_pick_firsIsScissor_secondIsRock_resultIsMatch() {
        let result = Game.pick(first: .scissors, second: .rock)
        
        XCTAssertEqual(result, .fail)
    }
    
    func test_pickCard_MatchResult_addPoint() {
        let sut = Score.make()
        
        let result = Game.pick(first: .paper, second: .rock)
        if case result = .match {
            sut.add()
        }
        
        XCTAssertEqual(sut.points, 1)
    }
    
    func test_pickCard_FailResult_removePoint() {
        let sut = Score.make()
        
        if case Game.pick(first: .paper, second: .rock) = .match {
            sut.add()
        }
        
        if case  Game.pick(first: .scissors, second: .rock) = .fail {
            sut.remove()
        }
        
        XCTAssertEqual(sut.points, 0)
    }
    
    func test_pickCard_increaseRounds() {
        let sut = Score.make()
        
        if case Game.pick(first: .paper, second: .rock) = .match {
            sut.add()
        }
        
        if case  Game.pick(first: .scissors, second: .rock) = .fail {
            sut.remove()
        }
        
        XCTAssertEqual(sut.rounds, 3)
    }
    
    func test_pickCard_firstIsEqualToSecond_resultIsEqual() {
        let result = Game.pick(first: .rock, second: .rock)
        
        XCTAssertEqual(result, .equal)
    }
    
    func test_game_resetSet() {
        let sut = Score.make()
        
        sut.reset()
        
        XCTAssertEqual(sut.points, 0)
        XCTAssertEqual(sut.rounds, 1)
    }
}
