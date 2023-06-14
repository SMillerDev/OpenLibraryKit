//
//  File.swift
//  
//
//  Created by Sean Molenaar on 13/06/2023.
//

import Foundation

// MARK: - Summary
struct Summary: Codable {
    let average: Double
    let count: Int
    let sortable: Double
}

// MARK: - BookRating
public struct BookRating: Codable {
    let summary: Summary
    let counts: [String: Int]
}

// MARK: - BookShelves
public struct BookShelves: Codable {
    let counts: Counts
}

// MARK: - Counts
struct Counts: Codable {
    let wantToRead, currentlyReading, alreadyRead: Int

    enum CodingKeys: String, CodingKey {
        case wantToRead = "want_to_read"
        case currentlyReading = "currently_reading"
        case alreadyRead = "already_read"
    }
}
