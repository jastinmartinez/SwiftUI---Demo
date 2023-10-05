//
//  Bin2DecTests.swift
//  Bin2DecTests
//
//  Created by Jastin on 5/10/23.
//

import XCTest
@testable import Bin2Dec

final class BinaryToDecimalConvertor {
    
    enum Error: Equatable, Swift.Error {
        case empty
        case invalidInput(String)
        case maxInput
    }
    
    enum Result {
        case success
        case failure(Error)
    }
    
    static func convert(from input: String) -> Result {
        guard !input.isEmpty else {
            return .failure(.empty)
        }
        
        guard input.count < 9 else {
            return .failure(.maxInput)
        }
        
        let invalidInputs = input.filter({$0 != "0" && $0 != "1"})
        
        guard invalidInputs.count == 0 else {
            return .failure(.invalidInput(invalidInputs))
        }
        
        return .success
    }
}

final class Bin2DecTests: XCTestCase {
    
    func test_binaryInputAllowMax8Digits() {
        let input = "000000000"
        let result = BinaryToDecimalConvertor.convert(from: input)
        switch result {
        case .failure(let error):
            XCTAssertEqual(error, .maxInput)
        case .success:
            XCTFail("expectec failure but instead got \(result)")
        }
    }
    
    func test_whenInputInvalidBinary_DeliversError() {
        let invaludInput = "234ab"
        let result = BinaryToDecimalConvertor.convert(from: invaludInput)
        switch result {
        case .failure(let error):
            XCTAssertEqual(error, .invalidInput(invaludInput))
        case .success:
            XCTFail("expectec failure but instead got \(result)")
        }
    }
    
    func test_whenInputEmptyBinary_ShouldReturnError() {
        let invaludInput = ""
        let result = BinaryToDecimalConvertor.convert(from: invaludInput)
        switch result {
        case .failure(let error):
            XCTAssertEqual(error, .empty)
        case .success:
            XCTFail("expectec failure but instead got \(result)")
        }
    }
}
