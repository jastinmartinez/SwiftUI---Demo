//
//  BinaryToDecimalConvertor.swift
//  Bin2Dec
//
//  Created by Jastin on 5/10/23.
//

import Foundation

public final class BinaryToDecimalConvertor {
    
    public enum Error: Equatable, Swift.Error {
        case empty
        case invalidInput(String)
        case maxInput
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
