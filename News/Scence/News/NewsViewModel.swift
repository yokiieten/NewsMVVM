//
//  NewsViewModel.swift
//  News
//
//  Created by Sahassawat on 20/1/2566 BE.
//

import Foundation
import RxSwift
import RxCocoa


struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
    var filterArticlesVM: [ArticleViewModel]
}

extension ArticleListViewModel {
    
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
        self.filterArticlesVM = articles.compactMap(ArticleViewModel.init)
    }
    
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.filterArticlesVM[index]
    }
    
    
}

struct ArticleViewModel {
    let article : Article
    init(_ article : Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
    
    var urlToImage: Observable<String> {
        return Observable<String>.just(article.urlToImage ?? "")
    }
    
    var publishedAt: Observable<String> {
        let date: String = DateFormatComponent().format(dateString: article.publishedAt ?? "",
                                                        sourcePattern: .transactionDateTimeAPI, destinationPattern: .hour).lowercased()
        return Observable<String>.just(date)
    }
    var content: Observable<String> {
        return Observable<String>.just(article.content ?? "No Content")
    }
    
    var source: Observable<String> {
        return Observable<String>.just(article.source?.name ?? "")
    }
}

