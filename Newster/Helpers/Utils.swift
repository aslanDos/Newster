//
//  Utils.swift
//  Newster
//
//  Created by Aslan Dossymzhan 2 on 26.11.2025.
//

import Foundation

func formattedDate(_ original: String) -> String? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    formatter.locale = Locale(identifier: "en_US_POSIX")

    if let date = formatter.date(from: original) {
        let output = DateFormatter()
        output.dateFormat = "MMM d, yyyy"
        return output.string(from: date)
    }
    return nil
}

