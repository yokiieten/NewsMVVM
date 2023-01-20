//
//  Article.swift
//  News
//
//  Created by Sahassawat on 20/1/2566 BE.
//

import Foundation

struct ArticleResponse : Decodable {
  let articles: [Article]
}


struct Article : Decodable {
  let title : String
  let description: String?
}
