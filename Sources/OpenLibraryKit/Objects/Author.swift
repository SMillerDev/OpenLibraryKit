// Author.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let author = try? newJSONDecoder().decode(Author.self, from: jsonData)

import Foundation

// MARK: - Author
public struct Author: Codable {
    let entityType: String?
    let photos: [Int]
    let links: [Link]
    let alternateNames: [String]
    let key, name: String
    let title: String?
    let wikipedia: String?
    let sourceRecords: [String]
    let fullerName: String?
    let birthDate: String
    let bio: Value
    let remoteIDS: RemoteIDS
    let personalName: String
    let latestRevision, revision: Int
    let created, lastModified: Value

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

// MARK: - Link
struct Link: Codable {
    let title: String?
    let url: String
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
public struct AuthorSearchResult: Codable {
    let key: String
    let name: String
    let alternateNames: [String]?
    let birthDate, deathDate, topWork: String?
    let workCount: Int
    let topSubjects: [String]?
    let version: Double

    enum CodingKeys: String, CodingKey {
        case key, name
        case alternateNames = "alternate_names"
        case birthDate = "birth_date"
        case deathDate = "death_date"
        case topWork = "top_work"
        case workCount = "work_count"
        case topSubjects = "top_subjects"
        case version = "_version_"
    }
}
