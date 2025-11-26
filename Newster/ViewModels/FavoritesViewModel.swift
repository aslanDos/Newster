import SwiftUI
import Combine

@MainActor
class FavoritesViewModel: ObservableObject {

    @Published var favoriteArticles: [Article] = []
    @Published var isLoading = false

    private let service = NewsService()
    private let favorites: FavoritesManager

    init(favorites: FavoritesManager) {
        self.favorites = favorites
        loadFavorites()
    }

    func loadFavorites() {
        Task {
            isLoading = true

            // Загружаем весь список новостей
            let allArticles: [Article]
            do {
                if service.useMock {
                    allArticles = try await service.fetchMock()
                } else {
                    allArticles = try await service.fetchLatest()
                }
            } catch {
                print("Error loading news:", error)
                isLoading = false
                return
            }

            favoriteArticles = allArticles.filter {
                favorites.favorites.contains($0.id)
            }

            isLoading = false
        }
    }
}
