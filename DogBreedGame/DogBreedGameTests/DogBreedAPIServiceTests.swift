//
//  DogBreedGameTests.swift
//  DogBreedGameTests
//
//  Created by Jastin on 24/10/21.
//

import XCTest
@testable import DogBreedGame

class DogBreedAPIServiceTests: XCTestCase {

  
    func testBreedListParse() throws {
        
        DogBreedAPIService<Breeds>().getAll(resource: Constant.listOfBreeds) { Breeds in
            
            XCTAssert(Breeds.count > 0)
        }
    }
}
