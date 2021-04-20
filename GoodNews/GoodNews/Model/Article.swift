//
//  Article.swift
//  GoodNews
//
//  Created by Jastin Martinez on 4/6/21.
//

import Foundation
struct Article: Decodable {
    let title: String?
    let description: String?
}

struct ArticleList : Decodable {
    let articles: [Article]
}
