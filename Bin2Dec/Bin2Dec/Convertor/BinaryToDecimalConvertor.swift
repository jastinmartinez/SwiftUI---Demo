//
//  BinaryToDecimalConvertor.swift
//  Bin2Dec
//
//  Created by Jastin on 5/10/23.
//

import Foundation

public enum BinaryToDecimalConvertor {
    
    public enum Error: LocalizedError, Swift.Error {
        case empty
        case invalidInput(String)
        case maxInput
        
        public var errorDescription: String? {
            switch self {
            case .empty:
                return "Please enter a value"
            case .invalidInput(let string):
                return string + " are invalid values"
            case .maxInput:
                return "the maximun input is 8"
            }
        }
    }
    
    public enum Result {
        case success(Decimal)
        case failure(Error)
        case none
    }
    
    public static func convert(from input: String) -> Result {
        guard !input.isEmpty else {
            return .failure(.empty)
        }
        
        guard input.count < 9 else {
            return .failure(.maxInput)
        }
        
        let invalidInputs = Set(input.filter({$0 != "0" && $0 != "1"})).sorted()
        
        guard invalidInputs.count == 0 else {
            return .failure(.invalidInput(String(invalidInputs)))
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
