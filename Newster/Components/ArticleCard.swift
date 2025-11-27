import SwiftUI
import Kingfisher

enum ArticleCardStyle {
    case horizontal
    case vertical
}

struct ArticleCard: View {
    let article: Article
    let style: ArticleCardStyle

    var body: some View {
        switch style {
        case .horizontal:
            horizontalCard
        case .vertical:
            verticalCard
        }
    }
}

// MARK: - Horizontal Card
private extension ArticleCard {

    var horizontalCard: some View {
        HStack(alignment: .top, spacing: 12) {

            KFImage(URL(string: article.image_url ?? ""))
                .placeholder {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.15))
                }
                .fade(duration: 0.25)
                .resizable()
                .scaledToFill()
                .frame(width: 110, height: 80)
                .clipped()
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 0) {

                Text(article.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                Spacer(minLength: 6)

                authorAndDate
            }
            .frame(maxHeight: 80, alignment: .top)

            Spacer(minLength: 0)
        }
        .padding(.vertical, 6)
    }
}

// MARK: - Vertical Card
private extension ArticleCard {

    var verticalCard: some View {
        VStack(alignment: .leading, spacing: 8) {

            KFImage(URL(string: article.image_url ?? ""))
                .placeholder {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.15))
                }
                .fade(duration: 0.25)
                .resizable()
                .scaledToFill()
                .frame(height: 140)
                .clipped()
                .cornerRadius(12)

            Text(article.title)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(3)
                .multilineTextAlignment(.leading)

            authorAndDate
        }
        .padding(.vertical, 6)
    }
}

// MARK: - Shared author + date block
private extension ArticleCard {

    var authorAndDate: some View {
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
