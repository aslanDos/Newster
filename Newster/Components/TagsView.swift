//
//  TagsView.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 27.11.2025.
//

import SwiftUI

struct TagViewItem: Hashable, Identifiable {
    let category: Category
    var isSelected: Bool = false
    
    var id: String { category.rawValue }

    var title: String {
        category.tag
    }
}

struct TagView: View {

    @State private var tags: [TagViewItem] = Category.allCases
        .prefix(8)
        .map { TagViewItem(category: $0) }

    var body: some View {
        FlowLayout(spacing: 8) {
            ForEach(tags.indices, id: \.self) { index in
                item(for: tags[index])
                    .onTapGesture {
                        tags[index].isSelected.toggle()
                    }
            }
        }
    }

    @ViewBuilder
    private func item(for tag: TagViewItem) -> some View {
        Text(tag.title)
            .font(.subheadline)
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .background(tag.isSelected ? Color.blue : Color.cyan.opacity(0.4))
            .foregroundColor(tag.isSelected ? .white : .black)
            .clipShape(Capsule())
    }
}

