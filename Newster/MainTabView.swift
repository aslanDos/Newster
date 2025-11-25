import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            FavoritesView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    MainTabView()
}
