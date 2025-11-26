//
//  NewsService.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 23.11.2025.
//
//
import Foundation

struct NewsService {
    
    private let apiKey: String = ProcessInfo.processInfo.environment["API_KEY"]!
    public let useMock = true
    
    func fetchLatest() async throws -> [Article] {
        let urlString = "https://newsdata.io/api/1/latest?apikey=\(apiKey)&language=ru"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode(News.self, from: data)
        
        return decoded.results
    }
}

extension NewsService {
    func fetchMock() async throws -> [Article] {
        
        if let url = Bundle.main.url(forResource: "NewsMock", withExtension: "json") {
            print("FOUND FILE:", url)
        } else {
            print("FILE NOT FOUND")
        }
        
        guard let url = Bundle.main.url(forResource: "NewsMock",
                                        withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }

        let data = try Data(contentsOf: url)
        let decoded = try JSONDecoder().decode(News.self, from: data)
        return decoded.results
    }
}
