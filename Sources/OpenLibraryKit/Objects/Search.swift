//
//  File.swift
//  
//
//  Created by Sean Molenaar on 25/06/2023.
//

import Foundation

public struct ContentSearchResult: Codable {
    let iaId: String
    enum CodingKeys: String, CodingKey {
        case iaId = "ia"
    }
}

public struct SearchResults: Codable {
    let start: Int
    let found: Int
    let exact: Bool
    let docs: [SearchResult]

    enum CodingKeys: String, CodingKey {
        case start, docs
        case found = "numFound"
        case exact = "numFoundExact"
    }
}

public struct SearchResult: OpenLibraryObject {
    public let title: String
    public let key: OpenLibraryKey
    public let authors: [String]?
    public let authorKeys: [String]?
    public let editionCount: Int
    public let coverId: Int?
    public let fullText: Bool
    public let publicScan: Bool

    enum CodingKeys: String, CodingKey {
        case key, title
        case authors = "author_name"
        case editionCount = "edition_count"
        case coverId = "cover_i"
        case fullText = "has_fulltext"
        case publicScan = "public_scan_b"
        case authorKeys = "author_key"

    }
}
