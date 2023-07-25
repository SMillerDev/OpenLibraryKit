// Author.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let author = try? newJSONDecoder().decode(Author.self, from: jsonData)

import Foundation

// MARK: - Author
public struct Author: OpenLibraryObject {
    public let key: OpenLibraryKey
    let entityType: String?
    let photos: [Int]
    let links: [LinkItem]
    let alternateNames: [String]
    let name: String
    let title: String?
    let wikipedia: String?
    let sourceRecords: [String]?
    let fullerName: String?
    let birthDate: String?
    let bio: StringValue
    let remoteIDS: RemoteIDS
    let personalName: String
    let latestRevision, revision: Int
    let created, lastModified: StringValue

    enum CodingKeys: String, CodingKey {
        case entityType = "entity_type"
        case photos, links
        case alternateNames = "alternate_names"
        case key, title, name, wikipedia
        case sourceRecords = "source_records"
        case fullerName = "fuller_name"
        case birthDate = "birth_date"
        case bio
        case remoteIDS = "remote_ids"
        case personalName = "personal_name"
        case latestRevision = "latest_revision"
        case revision, created
        case lastModified = "last_modified"
    }
}

// MARK: - RemoteIDS
struct RemoteIDS: Codable {
    let wikidata, isni, goodreads, viaf, librarything, amazon: String?
}

// MARK: - AuthorSearch
public struct AuthorSearch: Codable {
    let numFound, start: Int
    let numFoundExact: Bool
    let docs: [AuthorSearchResult]
}

// MARK: - Doc
public struct AuthorSearchResult: OpenLibraryObject {
    public let key: OpenLibraryKey
    let name: String
    let birthDate: String?
    let deathDate: String?
    let topWork: String?
    let workCount: Int
    let alternateNames: [String]?
    let topSubjects: [String]?

    enum CodingKeys: String, CodingKey {
        case key, name
        case alternateNames = "alternate_names"
        case birthDate = "birth_date"
        case deathDate = "death_date"
        case topWork = "top_work"
        case workCount = "work_count"
        case topSubjects = "top_subjects"
    }
}
