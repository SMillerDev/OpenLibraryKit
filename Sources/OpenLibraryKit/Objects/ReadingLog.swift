//
//  File.swift
//  
//
//  Created by Sean Molenaar on 13/06/2023.
//

import Foundation

// MARK: - ReadingLog
public struct ReadingLog: Codable {
    let page: Int
    let readingLogEntries: [ReadingLogEntry]

    enum CodingKeys: String, CodingKey {
        case page
        case readingLogEntries = "reading_log_entries"
    }
}

// MARK: - ReadingLogEntry
public struct ReadingLogEntry: Codable {
    public let work: ReadingLogWork
    public let loggedEdition: String?
    public let loggedDate: String?

    enum CodingKeys: String, CodingKey {
        case work
        case loggedEdition = "logged_edition"
        case loggedDate = "logged_date"
    }
}

// MARK: - Work
public struct ReadingLogWork: Codable {
    public let title: String
    public let authorNames: [String]
    public let firstPublishYear: Int
    public let coverID: Int?
    public let coverEditionKey: String?
    public let authorKeys: [String]

    public let key: String
    let lendingEditionS: String?
    let editionKey: [String]

    enum CodingKeys: String, CodingKey {
        case title, key
        case authorKeys = "author_keys"
        case authorNames = "author_names"
        case firstPublishYear = "first_publish_year"
        case lendingEditionS = "lending_edition_s"
        case editionKey = "edition_key"
        case coverID = "cover_id"
        case coverEditionKey = "cover_edition_key"
    }
}
