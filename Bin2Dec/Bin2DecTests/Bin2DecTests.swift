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
        case success(Decimal)
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
        
        let decimal = input
            .compactMap({$0.wholeNumberValue})
            .reversed()
            .enumerated()
            .reduce(into: Decimal()) { acc, value in
                if (.zero,.zero) != value {
                    acc += pow(Decimal(value.element * 2), value.offset)
                }
            }
        
        return .success(decimal)
    }
}

final class Bin2DecTests: XCTestCase {
    
    func test_binaryInputAllowMax8Digits() {
        let input = "000000000"
        forErrorExpect(when: input, diplay: .maxInput)
    }
    
    func test_whenInputInvalidBinary_DeliversError() {
        let invalid = "234ab"
        forErrorExpect(when: invalid, diplay: .invalidInput(invalid))
    }
    
    func test_whenInputEmptyBinary_ShouldReturnError() {
        forErrorExpect(when: "", diplay: .empty)
    }
    
    func test_whenValidBinaryInput_11001010_TransformToDecimal() {
        let validInput = "11001010"
        let expectedResult: Decimal = 202
        let result = BinaryToDecimalConvertor.convert(from: validInput)
        switch result {
        case .success(let capturedResult):
            XCTAssertEqual(capturedResult, expectedResult)
        case .failure:
            XCTFail("expectec success but instead got \(result)")
        }
    }
    
    func test_whenValidBinaryInput_11101110_TransformToDecimal() {
        let validInput = "11101110"
        let expectedResult: Decimal = 238
        let result = BinaryToDecimalConvertor.convert(from: validInput)
        switch result {
        case .success(let capturedResult):
            XCTAssertEqual(capturedResult, expectedResult)
        case .failure:
            XCTFail("expectec success but instead got \(result)")
        }
    }
    
    //   MARK: Helpers
    private func forErrorExpect(when input: String,
                                diplay expectedError: BinaryToDecimalConvertor.Error,
                                file: StaticString = #filePath,
                                line: UInt = #line) {
        let result = BinaryToDecimalConvertor.convert(from: input)
        switch result {
        case .failure(let error):
            XCTAssertEqual(error, expectedError,
                           file: file,
                           line: line)
        case .success:
            XCTFail("expectec failure but instead got \(result)",
                    file: file,
                    line: line)
        }
    }
}
