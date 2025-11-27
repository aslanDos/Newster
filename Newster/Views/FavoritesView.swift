import SwiftUI
import Combine

struct FavoritesView: View {

    @EnvironmentObject var favorites: FavoritesManager
    @StateObject private var viewModel: FavoritesViewModel

    init(favorites: FavoritesManager) {
        _viewModel = StateObject(wrappedValue: FavoritesViewModel(favorites: favorites))
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // MARK: Header
                    Text("Favorites")
                        .font(.largeTitle.bold())
                        .padding(.horizontal)

                    // MARK: Articles list
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.favoriteArticles) { article in
                            NavigationLink(destination: ArticleDetailView(article: article)) {
                                ArticleCard(article: article, style: .horizontal)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationBarTitleDisplayMode(.inline)
            .onReceive(favorites.$favorites) { _ in
                viewModel.loadFavorites()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
            }
        }
    }
}
