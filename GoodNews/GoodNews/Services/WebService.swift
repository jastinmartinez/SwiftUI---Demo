//
//  WebService.swift
//  GoodNews
//
//  Created by Jastin Martinez on 4/6/21.
//

import Foundation
class WebService {
    func getArticles(url: URL,completion: @escaping ([Article]?) -> ()){
        URLSession.shared.dataTask(with: url){ data,response,error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let articles = try? JSONDecoder().decode(ArticleList.self, from: data).articles
            
                if let article = articles {
                    completion(article)
                }
            }
        }.resume()
    }
}
