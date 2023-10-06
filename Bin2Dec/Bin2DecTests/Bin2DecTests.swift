//
//  Bin2DecTests.swift
//  Bin2DecTests
//
//  Created by Jastin on 5/10/23.
//

import XCTest
@testable import Bin2Dec

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
        forSuccessExpect(when: "11001010", expectedResult: 202)
    }
    
    func test_whenValidBinaryInput_11101110_TransformToDecimal() {
        forSuccessExpect(when: "11101110", expectedResult: 238)
    }
    
    //   MARK: Helpers
    
    private func forSuccessExpect(when input: String,
                                  expectedResult: Decimal,
                                  file: StaticString = #filePath,
                                  line: UInt = #line) {
        let result = BinaryToDecimalConvertor.convert(from: input)
        switch result {
        case .success(let capturedResult):
            XCTAssertEqual(capturedResult, expectedResult)
        case .failure:
            XCTFail("expectec success but instead got \(result)")
        }
    }
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
