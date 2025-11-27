import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    @StateObject private var vm = NewsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: Search
                    SearchBar(text: $searchText)
                    
                    // MARK: Popular tags header
                    HStack {
                        Text("Popular tags")
                            .font(.title.bold())

                        Spacer()
                        
                        Button("Show All") { }
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)

                    // MARK: Popular tags content
                    TagView()
                        .padding(.horizontal)
                    
                    // MARK: Latest header
                    HStack {
                        Text("Latest News")
                            .font(.title.bold())
                        Spacer()
                        Button("Show All") { }
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                    
                    
                    // MARK: Articles list
                    LazyVStack(spacing: 16) {
                        ForEach(vm.articles.prefix(4)) { article in
                            NavigationLink(destination: ArticleDetailView(article: article)) {
                                ArticleCard(article: article, style: .vertical)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await vm.loadLatest()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(FavoritesManager())
}
