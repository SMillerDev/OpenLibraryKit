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
    let work: ReadingLogWork
    let loggedEdition, loggedDate: String?

    enum CodingKeys: String, CodingKey {
        case work
        case loggedEdition = "logged_edition"
        case loggedDate = "logged_date"
    }
}

// MARK: - Work
struct ReadingLogWork: Codable {
    let title, key: String
    let authorKeys, authorNames: [String]
    let firstPublishYear: Int
    let lendingEditionS: String?
    let editionKey: [String]
    let coverID: Int?
    let coverEditionKey: String?

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
