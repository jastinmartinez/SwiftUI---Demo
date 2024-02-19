//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by Jastin on 18/2/24.
//

import XCTest
@testable import RockPaperScissors



final class RockPaperScissorsTests: XCTestCase {
    
    func test_init_game_scoreIsZero() {
        let sut = Game()
        
        XCTAssertEqual(sut.points, .zero)
    }
    
    func test_init_game_defaultRoundIsTen() {
        let sut = Game()
        
        XCTAssertEqual(sut.rounds, 10)
    }
    
    func test_pick_firsIsPaper_secondIsRock_resultIsMatch() {
        let sut = Game()
        
        let result = sut.pickCard(first: .paper, second: .rock)
        
        XCTAssertEqual(result, .match)
    }
    
    func test_pick_firsIsScissor_secondIsPaper_resultIsFail() {
        let sut = Game()
        
        let result = sut.pickCard(first: .scissors, second: .paper)
        
        XCTAssertEqual(result, .match)
    }
    
    func test_pick_firsIsRock_secondIsScissor_resultIsMatch() {
        let sut = Game()
        
        let result = sut.pickCard(first: .rock, second: .scissors)
        
        XCTAssertEqual(result, .match)
    }
    
    func test_pick_firsIsRock_secondIsPaper_resultIsMatch() {
        let sut = Game()
        
        let result = sut.pickCard(first: .rock, second: .paper)
        
        XCTAssertEqual(result, .fail)
    }
    
    func test_pick_firsIsPaper_secondIsScissor_resultIsFail() {
        let sut = Game()
        
        let result = sut.pickCard(first: .paper, second: .scissors)
        
        XCTAssertEqual(result, .fail)
    }
    
    func test_pick_firsIsScissor_secondIsRock_resultIsMatch() {
        let sut = Game()
        
        let result = sut.pickCard(first: .scissors, second: .rock)
        
        XCTAssertEqual(result, .fail)
    }
    
    func test_pickCard_MatchResult_addPoint() {
        var sut = Game()
        
        let result = sut.pickCard(first: .paper, second: .rock)
        if case result = .match {
            sut.addPoint()
        }
        
        XCTAssertEqual(sut.points, 1)
    }
    
    func test_pickCard_FailResult_removePoint() {
        var sut = Game()
        
        if case sut.pickCard(first: .paper, second: .rock) = .match {
            sut.addPoint()
        }
        
        if case sut.pickCard(first: .scissors, second: .rock) = .fail {
            sut.removePoint()
        }
        
        XCTAssertEqual(sut.points, 0)
    }
    
    func test_pickCard_decreaseRounds() {
        var sut = Game()
        
        if case sut.pickCard(first: .paper, second: .rock) = .match {
            sut.addPoint()
        }
        
        if case sut.pickCard(first: .scissors, second: .rock) = .fail {
            sut.removePoint()
        }
        
        XCTAssertEqual(sut.rounds, 8)
    }
    
    func test_pickCard_firstIsEqualToSecond_resultIsEqual() {
        let sut = Game()
        
        let result = sut.pickCard(first: .rock, second: .rock)
        
        XCTAssertEqual(result, .equal)
    }
    
    func test_game_resetSet() {
        let sut = Game()
        
        sut.reset()
        
        XCTAssertEqual(sut.points, 0)
        XCTAssertEqual(sut.rounds, 10)
    }
}
