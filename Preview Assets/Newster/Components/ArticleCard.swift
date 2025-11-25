//
//  ArticleCard.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 23.11.2025.
//

import SwiftUI

struct ArticleCard: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            if let image = article.image_url,
               let url = URL(string: image) {
                AsyncImage(url: url) { img in
                    img.resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(height: 180)
                .clipped()
                .cornerRadius(12)
            }

            Text(article.title)
                .font(.headline)

            if let desc = article.description {
                Text(desc)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }

            Text(article.pubDate)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    ArticleCard(article: Article.mocks[0])
        .padding()
}
