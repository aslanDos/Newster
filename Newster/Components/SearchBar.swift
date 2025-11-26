//
//  SearchBar.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 24.11.2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String = "Search"

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField(placeholder, text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)

            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
        .animation(.easeInOut(duration: 0.2), value: text)
    }
}


