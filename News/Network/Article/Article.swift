//
//  Article.swift
//  News
//
//  Created by Sahassawat on 20/1/2566 BE.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}


struct Article: Decodable {
    let title: String
    let description: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    let source: Source?
}

struct Source: Decodable {
    let id: String?
    let name: String?
}
