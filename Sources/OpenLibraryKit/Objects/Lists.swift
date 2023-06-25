//
//  File.swift
//  
//
//  Created by Sean Molenaar on 25/06/2023.
//

import Foundation

// MARK: - Lists
public struct Lists: Codable {
    let links: Links
    let size: Int
    let entries: [List]

    enum CodingKeys: String, CodingKey {
        case links, size, entries
    }
}

// MARK: - Lists
public struct ListSearch: Codable {
    let start: Int
    let docs: [List]

    enum CodingKeys: String, CodingKey {
        case start, docs
    }
}

// MARK: - List
public struct List: Codable {
    let url: URL
    let fullUrl: URL
    let name: String
    let lastUpdated: String?
    let seedCount: Int
    let editionCount: Int?

    enum CodingKeys: String, CodingKey {
        case url, name
        case lastUpdated = "last_update"
        case fullUrl = "full_url"
        case seedCount = "seed_count"
        case editionCount = "edition_count"
    }
}

// MARK: - SingleList
public struct SingleList: Codable {
    let name: String
    let description: String
    let seedCount: Int
    let editionCount: Int?

    enum CodingKeys: String, CodingKey {
        case name, description
        case seedCount = "seed_count"
        case editionCount = "edition_count"
    }
}
