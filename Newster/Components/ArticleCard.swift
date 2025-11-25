import SwiftUI

struct ArticleCard: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            if let image = article.image_url,
               let url = URL(string: image) {
                
                AsyncImage(url: url) { img in
                    img.resizable()
                        .aspectRatio(1.78, contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                }
                .frame(height: 200)
                .clipped()
                .cornerRadius(12)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: 200)
                    .cornerRadius(12)
            }

            Text(article.title)
                .font(.headline)
                .foregroundColor(.primary)

            if let desc = article.description, !desc.isEmpty {
                Text(desc)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
        }
        .padding()
    }
}
