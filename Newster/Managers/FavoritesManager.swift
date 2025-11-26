//
//  FavoritesManager.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 26.11.2025.
//

import SwiftUI
import Combine

@MainActor
class FavoritesManager: ObservableObject {

    @Published var favorites: [String] = []

    private let key = "favorite_ids"

    init() {
        load()
    }

    // MARK: - Load
    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let ids = try? JSONDecoder().decode([String].self, from: data) {
            self.favorites = ids
        }
    }

    // MARK: - Save
    private func save() {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    // MARK: - Public API
    func isBookmarked(_ id: String) -> Bool {
        favorites.contains(id)
    }

    func toggle(_ id: String) {
        if favorites.contains(id) {
            favorites.removeAll { $0 == id }
        } else {
            favorites.append(id)
        }
        save()
    }
}
