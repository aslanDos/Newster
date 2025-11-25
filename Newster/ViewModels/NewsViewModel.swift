////
////  NewsViewModel.swift
////  Newster
////
////  Created by Aslan Dossymzhan 2 on 23.11.2025.
////
//
import Foundation
import Combine

@MainActor
class NewsViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var isLoading = false
    
    private let service = NewsService()
    
    func loadLatest() async {
        isLoading = true
        do {
            let fetched = try await service.fetchMock()
            self.articles = fetched
        } catch {
            print("Error loading news:", error)
        }
    }
}
