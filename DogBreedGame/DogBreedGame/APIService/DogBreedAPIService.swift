//
//  APIService.swift
//  DogBreedGame
//
//  Created by Jastin on 24/10/21.
//

import Foundation
import Alamofire

final class DogBreedAPIService<T: Decodable>: APIServiceProtocol {
    
    typealias DataType = T
    
    func getSingle(resource: String, completion: @escaping (T) -> ()) where T : Decodable {
        
        AF.request(resource,method: .get).responseDecodable(of: T.self)  { response  in
            
            if let data = response.value {
                print(data)
                completion(data)
            }
        }
    }
    
    func getAll(resource: String,completion: @escaping ([T]) -> ()) {
        
        AF.request(resource,method: .get).responseDecodable(of: [T].self)  { response  in
            
            if let data = response.value {
                
                completion(data)
            }
        }
    }
}
