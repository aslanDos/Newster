//
//  HomeView.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 23.11.2025.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm = NewsViewModel()
    
    var body: some View {
        NavigationView {
            List (vm.articles) { article in
                Section {
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        ArticleCard(article: article)
                    }
                }
            }
            .navigationTitle("Latest News")
            .task {
                await vm.loadLatest()
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(FavoritesManager())
}

