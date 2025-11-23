//
//  Article.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 23.11.2025.
//

import Foundation

struct Article: Identifiable, Codable {
    var id: String { article_id }

    let article_id: String
    let link: String
    let title: String
    let description: String?
    let content: String?
    let keywords: [String]?
    let creator: [String]?
    let language: String?
    let country: [String]?
    let category: [String]?
    let pubDate: String
    let image_url: String?
}

extension Article {
    static let mocks: [Article] = [
        Article(
            article_id: "test-article-123",
            link: "https://example.com/news/test-article",
            title: "Breaking News: SwiftUI Makes Development Fun Again!",
            description: "Developers around the world are celebrating as SwiftUI continues to simplify UI creation.",
            content: "Full article content goes here...",
            keywords: ["swift", "apple", "swiftui", "development"],
            creator: ["John Doe"],
            language: "english",
            country: ["united states"],
            category: ["technology"],
            pubDate: "2025-11-23",
            image_url: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e"
        ),
        Article(
            article_id: "test-article-123",
            link: "https://example.com/news/test-article",
            title: "Breaking News: SwiftUI Makes Development Fun Again!",
            description: "Developers around the world are celebrating as SwiftUI continues to simplify UI creation.",
            content: "Full article content goes here...",
            keywords: ["swift", "apple", "swiftui", "development"],
            creator: ["John Doe"],
            language: "english",
            country: ["united states"],
            category: ["technology"],
            pubDate: "2025-11-23",
            image_url: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e"
        ),
        Article(
            article_id: "test-article-123",
            link: "https://example.com/news/test-article",
            title: "Breaking News: SwiftUI Makes Development Fun Again!",
            description: "Developers around the world are celebrating as SwiftUI continues to simplify UI creation.",
            content: "Full article content goes here...",
            keywords: ["swift", "apple", "swiftui", "development"],
            creator: ["John Doe"],
            language: "english",
            country: ["united states"],
            category: ["technology"],
            pubDate: "2025-11-23",
            image_url: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e"
        ),
    ]
}
