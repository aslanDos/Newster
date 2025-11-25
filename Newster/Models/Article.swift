//
//  Article.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 23.11.2025.
//

import Foundation

struct Article: Codable, Identifiable {
    let id: String
    let link: String
    let title: String
    let description: String?
    let content: String
    let keywords: [String]?
    let creator: [String]?
    let language: String
    let country: [String]
    let category: [String]
    let pubDate: String
    let image_url: String?
    
    enum CodingKeys: String, CodingKey {
        case link, title, description, content, keywords, creator, language, country, category, pubDate, image_url
        case id = "article_id"
    }
}

