//
//  IAPIService.swift
//  DogBreedGame
//
//  Created by Jastin on 24/10/21.
//

import Foundation

protocol DogBreedAPIProtocol {
    
    associatedtype DataType
    
    func getAll(resource: String,completion: @escaping ([DataType]) -> ())
    
    func getSingle(resource: String,completion: @escaping (DataType) -> ())
}
