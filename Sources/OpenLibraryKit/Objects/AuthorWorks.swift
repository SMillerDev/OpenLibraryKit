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
public struct AuthorWork: Codable {
    let type: TypeClass
    let title: String
    let authors: [AuthorItem]
    let key: String
    let latestRevision, revision: Int
    let created, lastModified: Value
    let covers: [Int]?
    let description: Description?
    let subjectPlaces: [String]?
    let firstPublishDate: String?
    let subjectPeople, subjectTimes, subjects: [String]?
    let firstSentence: Value?
    let excerpts: [Excerpt]?
    let links: [Link]?
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
    let linksSelf, author, next: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case author, next
    }
}

// MARK: - Author
struct AuthorItem: Codable {
    let type, author: TypeClass
}

// MARK: - TypeClass
struct TypeClass: Codable {
    let key: String
}

enum TypeEnum: String, Codable {
    case typeDatetime = "/type/datetime"
    case typeText = "/type/text"
}


// MARK: - Excerpt
struct Excerpt: Codable {
    let excerpt: String
    let comment: String?
    let author: TypeClass?
}

enum Description: Codable {
    case created(Value)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(Value.self) {
            self = .created(x)
            return
        }
        throw DecodingError.typeMismatch(Description.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Description"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .created(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}
