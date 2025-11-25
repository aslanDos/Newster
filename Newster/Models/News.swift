//
//  NewsResponse.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 25.11.2025.
//

import Foundation
import Playgrounds

struct News: Codable {
    let results: [Article]
}

#Playground {
    
    let apiKey: String = ProcessInfo.processInfo.environment["API_KEY"]!
    
    do {
        guard let url = URL(string:
            "https://newsdata.io/api/1/latest?apikey=\(apiKey)"
        ) else {
            print("Invalid URL")
            return
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let response = try JSONDecoder().decode(News.self, from: data)
        print(response.results)

    } catch {
        print(error)
    }
}
