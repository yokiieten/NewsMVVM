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

 struct API {
     static let apiKey: String = "6b20b05ef9e44a87804b0281c77a7f91"
}
