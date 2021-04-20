//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Jastin Martinez on 4/6/21.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}
extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowInsection(_ section: Int) -> Int {
        return self.articles.count
    }
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: Article
    
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String? {
        return self.article.title
    }
    var description: String? {
        return self.article.description
    }
}
