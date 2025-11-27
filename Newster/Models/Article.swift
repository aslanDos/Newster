//
//  Article.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 23.11.2025.
//

import Foundation

enum Category: String, Codable, CaseIterable, Identifiable {
    case business
    case crime
    case domestic
    case education
    case entertainment
    case environment
    case food
    case health
    case lifestyle
    case politics
    case science
    case sports
    case technology
    case top
    case tourism
    case world
    case other
    
    var id: String { rawValue }

    var displayName: String {
        rawValue.capitalized
    }

    var tag: String {
        "#\(rawValue)"
    }
}

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
    let category: [Category]
    let pubDate: String
    let image_url: String?
    
    enum CodingKeys: String, CodingKey {
        case link, title, description, content, keywords, creator, language, country, category, pubDate, image_url
        case id = "article_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        link = try container.decode(String.self, forKey: .link)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        content = try container.decode(String.self, forKey: .content)
        keywords = try container.decodeIfPresent([String].self, forKey: .keywords)
        creator = try container.decodeIfPresent([String].self, forKey: .creator)
        language = try container.decode(String.self, forKey: .language)
        country = try container.decode([String].self, forKey: .country)
        pubDate = try container.decode(String.self, forKey: .pubDate)
        image_url = try container.decodeIfPresent(String.self, forKey: .image_url)
            
        let rawCategories = try container.decodeIfPresent([String].self, forKey: .category) ?? []
        self.category = rawCategories.map { raw in
            Category(rawValue: raw.lowercased()) ?? .other
        }
    }
}

