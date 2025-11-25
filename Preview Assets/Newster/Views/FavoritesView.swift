//
//  FavoritesView.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 23.11.2025.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Favorites")
                        .bold()
                    Text("Favorites")
                        .bold()
                }
                Text("Favorites")
                    .bold()
                Text("Favorites")
                    .bold()
                Text("Favorites")
                    .bold()
                Text("Favorites")
                    .bold()
            }
            .navigationTitle("Newster")
        }
    }
}

#Preview {
    FavoritesView()
}
