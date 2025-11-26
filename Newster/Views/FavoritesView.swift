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
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if viewModel.favoriteArticles.isEmpty {
                    ContentUnavailableView(
                        "No favorites",
                        systemImage: "bookmark",
                        description: Text("You haven't saved any articles yet.")
                    )
                } else {
                    List(viewModel.favoriteArticles) { article in
                        Section {
                            NavigationLink {
                                ArticleDetailView(article: article)
                                    .environmentObject(favorites)
                            } label: {
                                ArticleCard(article: article)
                            }
                        }
                    }
    
                }
            }
            .navigationTitle("Favorites")
            .onReceive(favorites.$favorites) { _ in
                viewModel.loadFavorites()
            }
        }
    }
}
