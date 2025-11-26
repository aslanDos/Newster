import SwiftUI
import Kingfisher

struct ArticleCard: View {
    let article: Article

    var body: some View {
        HStack(alignment: .top, spacing: 12) {

            // MARK: - Image
            if let image = article.image_url,
               let url = URL(string: image) {

                KFImage(url)
                    .placeholder {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.15))
                    }
                    .fade(duration: 0.25)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 110)
                    .clipped()
                    .cornerRadius(12)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 110, height: 110)
            }

            // MARK: - Text Body
            VStack(alignment: .leading, spacing: 6) {

                // CATEGORY
                if let category = article.category.first {
                    Text(category.capitalized)
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                // TITLE
                Text(article.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(2)

                // AUTHOR + DATE
                HStack(spacing: 6) {

                    if let creator = article.creator?.first {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 22, height: 22)
                            .overlay(
                                Text(String(creator.prefix(1)))
                                    .foregroundColor(.white)
                                    .font(.caption)
                            )
                        Text(creator)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    if let date = formattedDate(article.pubDate) {
                        Text("•")
                            .foregroundColor(.gray)
                        Text(date)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding(.vertical, 6)
    }
}
