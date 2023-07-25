//
//  File.swift
//  
//
//  Created by Sean Molenaar on 13/06/2023.
//

import Foundation

// MARK: - Summary
public struct Summary: Codable {
    public let average: Double?
    public let count: Int
    public let sortable: Double?
}

// MARK: - BookRating
public struct BookRating: Codable {
    public let summary: Summary?
    public let counts: [String: Int]
}

// MARK: - BookShelves
public struct BookShelves: Codable {
    public let counts: Counts
}

// MARK: - Counts
public struct Counts: Codable {
    public let wantToRead, currentlyReading, alreadyRead: Int

    enum CodingKeys: String, CodingKey {
        case wantToRead = "want_to_read"
        case currentlyReading = "currently_reading"
        case alreadyRead = "already_read"
    }
}
