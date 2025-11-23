////
////  NewsViewModel.swift
////  Newster
////
////  Created by Aslan Dossymzhan 2 on 23.11.2025.
////
//
//import Foundation
//import SwiftUI
//
//@MainActor
//class NewsViewModel: ObservableObject {
//
//    @Published var articles: [Article] = []
//    @Published var isLoading = false
//
//    private let service = NewsService()
//
//    func loadNews() async {
//        isLoading = true
//        do {
//            articles = try await service.fetchTopNews()
//        } catch {
//            print("Error loading news: \(error)")
//        }
//        isLoading = false
//    }
//}
