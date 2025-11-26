import SwiftUI
import Kingfisher

struct ArticleDetailView: View {
    
    let article: Article
    
    @EnvironmentObject var favorites: FavoritesManager
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 0) {
                
                headerSection
                    .frame(height: 320)
                    .clipped()
                
                contentCard
                    .padding(.top, -30)
                
                date
                    .padding(.top, 32)
                    .padding(.bottom, 16)
            }
            
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    favorites.toggle(article.id)
                } label: {
                    Image(systemName: favorites.isBookmarked(article.id) ? "heart.fill" : "heart")
                        .font(.title3)
                        .foregroundColor(favorites.isBookmarked(article.id) ? .blue : .gray)
                }
            }
        }

    }
}

extension ArticleDetailView {
    
    // MARK: - HEADER
    private var headerSection: some View {
        VStack(alignment: .leading) {
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                
                if let category = article.category.first {
                    Text(category.capitalized)
                        .font(.subheadline.bold())
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.blue.opacity(0.85))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                
                Text(article.title)
                    .font(.title.bold())
                    .foregroundColor(.white)
            }
            .padding(.bottom, 60)
        }
        .frame(height: 320)
        .frame(maxWidth: .infinity)
        .background(
            headerImage
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(0.85)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        )
        .clipped()
    }

    
    // Header Image builder
    private var headerImage: some View {
        Group {
            if let url = URL(string: article.image_url ?? "") {
                KFImage(url)
                    .resizable()
                    .scaledToFill()
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
            }
        }
    }
    
    // MARK: - CONTENT BLOCK
    private var contentCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            authorBlock
            articleСontent
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 36)
                .fill(Color.white)
                .shadow(radius: 4)
        )
    }
    
    // MARK: Author block
    private var authorBlock: some View {
        HStack(spacing: 12) {
            if let creator = article.creator?.first {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 36, height: 36)
                    .overlay(
                        Text(String(creator.prefix(1)))
                            .foregroundColor(.white)
                    )
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(article.creator?.first ?? "Unknown")
                    .font(.subheadline.bold())
                
                if let date = formattedDate(article.pubDate) {
                    Text(date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    // MARK: Article content
    private var articleСontent: some View {
        Text(article.content)
            .font(.body)
            .foregroundColor(.primary)
            .lineSpacing(6)
    }
    
    private var date: some View {
        Text(formattedDate(article.pubDate)!)
            .bold()
    }
}
