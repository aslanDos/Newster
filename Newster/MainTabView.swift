import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var favorites: FavoritesManager
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            FavoritesView(favorites: favorites)
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(FavoritesManager())
}
