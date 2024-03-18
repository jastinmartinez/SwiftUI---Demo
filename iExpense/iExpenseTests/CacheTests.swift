//
//  Cache.swift
//  iExpenseTests
//
//  Created by Jastin on 17/3/24.
//

import XCTest

final class Cache {
    
    private let storer: UserDefaults
    
    init(storer: UserDefaults) {
        self.storer = storer
    }
    
    func save(_ item: Encodable, for key: String, completion: (Error?) -> Void) {
        do {
            let data = try JSONEncoder().encode(item)
            storer.setValue(data, forKey: key)
            completion(nil)
        } catch {
            completion(error)
        }
    }
}

final class CacheTests: XCTestCase {

    func test_saveCache_storeValues() {
        let item = "Data"
        let sut = Cache(storer: .standard)
        let exp = expectation(description: "wait for saved cache")
        
        sut.save(item, for: "data", completion: { error in
            XCTAssertNil(error)
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_saveCache_deliversErrorOnInvalidJSON() {
        let invalidObject = InvalidObject()
        let sut = Cache(storer: .standard)
        let exp = expectation(description: "wait for saved cache")
        
        sut.save(invalidObject, for: "data", completion: { error in
            XCTAssertNotNil(error)
            exp.fulfill()
        })
        wait(for: [exp], timeout: 1.0)
    }
    
    private struct InvalidObject: Encodable {
        func encode(to encoder: any Encoder) throws {
            throw NSError(domain: "Error", code: 0)
        }
    }
}

