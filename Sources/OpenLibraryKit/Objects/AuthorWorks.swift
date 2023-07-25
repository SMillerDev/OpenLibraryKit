//
//  File.swift
//  
//
//  Created by Sean Molenaar on 13/06/2023.
//

import Foundation

// MARK: - AuthorWorks
struct AuthorWorks: Codable {
    let links: Links
    let size: Int
    let entries: [AuthorWork]
}

// MARK: - Entry
public struct AuthorWork: OpenLibraryObject {
    let type: TypeClass
    let title: String
    let authors: [AuthorItem]
    public let key: OpenLibraryKey
    let latestRevision, revision: Int
    let created, lastModified: DateValue
    let covers: [Int]?
    let description: StringOrDict?
    let subjectPlaces: [String]?
    let firstPublishDate: String?
    let subjectPeople, subjectTimes, subjects: [String]?
    let firstSentence: StringValue?
    let excerpts: [Excerpt]?
    let links: [LinkItem]?
    let location: String?
    let deweyNumber, lcClassifications: [String]?

    enum CodingKeys: String, CodingKey {
        case type, title, authors, key
        case latestRevision = "latest_revision"
        case revision, created
        case lastModified = "last_modified"
        case covers, description
        case subjectPlaces = "subject_places"
        case firstPublishDate = "first_publish_date"
        case subjectPeople = "subject_people"
        case subjectTimes = "subject_times"
        case subjects
        case firstSentence = "first_sentence"
        case excerpts, links, location
        case deweyNumber = "dewey_number"
        case lcClassifications = "lc_classifications"
    }
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: String
    let next: String?
    let author: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case author, next
    }
}

// MARK: - Author
struct AuthorItem: Codable {
    let type, author: TypeClass
}

// MARK: - Excerpt
public struct Excerpt: Codable {
    public let excerpt: String
    public let comment: String?
    public let author: TypeClass?
}

public enum StringOrDict: Codable {
    case stringObj(StringValue)
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
            return
        }
        if let value = try? container.decode(StringValue.self) {
            self = .stringObj(value)
            return
        }
        throw DecodingError.typeMismatch(StringOrDict.self,
                                         DecodingError.Context(
                                            codingPath: decoder.codingPath,
                                            debugDescription: "Wrong type for Description"
                                         )
        )
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .stringObj(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}
