//
//  File.swift
//  
//
//  Created by Sean Molenaar on 20/07/2023.
//

import Foundation

public struct TrendingList: Codable {
    let query: String
    let works: [TrendingItem]
}

public struct TrendingItem: OpenLibraryObject {
    public let key: OpenLibraryKey
    public let title: String
    public let editionCount: Int
    public let firstPublishYear: Int?
    public let coverEditionKey: String?
    public let coverId: Int?
    public let languages: [String]?
    public let authorKeys: [String]?
    public let authorNames: [String]?

    enum CodingKeys: String, CodingKey {
        case key, title
        case editionCount = "edition_count"
        case firstPublishYear = "first_publish_year"
        case coverEditionKey = "cover_edition_key"
        case coverId = "cover_i"
        case languages = "language"
        case authorKeys = "author_key"
        case authorNames = "author_name"
    }
}
