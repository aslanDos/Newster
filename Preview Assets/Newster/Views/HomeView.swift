//
//  HomeView.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 23.11.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var query = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $query)
        }
    }
}

