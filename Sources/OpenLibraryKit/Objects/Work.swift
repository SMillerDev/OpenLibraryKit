//
//  File.swift
//  
//
//  Created by Sean Molenaar on 13/06/2023.
//

import Foundation

// MARK: - Work
public struct Work: OpenLibraryObject {
    public let bookDescription: StringOrDict?
    public let links: [LinkItem]?
    public let title: String
    public let covers: [Int]
    public let firstSentence: StringValue?
    public let subjectPlaces: [String]?
    public let firstPublishDate: String?
    public let subjectPeople: [String]?
    public let key: OpenLibraryKey
    public let authors: [WorkAuthor]
    public let excerpts: [Excerpt]?
    public let subjects: [String]
    public let location: String?
    public let latestRevision, revision: Int
    public let created, lastModified: DateValue

    enum CodingKeys: String, CodingKey {
        case links, title, covers
        case bookDescription = "description"
        case firstSentence = "first_sentence"
        case subjectPlaces = "subject_places"
        case firstPublishDate = "first_publish_date"
        case subjectPeople = "subject_people"
        case key, authors, excerpts, subjects, location
        case latestRevision = "latest_revision"
        case revision, created
        case lastModified = "last_modified"
    }

    public func getImage(size: String, useDefault: Bool) -> URL? {
        return URL(string: "https://covers.openlibrary.org/b/id/\(self.covers.first ?? 0)-\(size).jpg?default=\(useDefault ? "true" : "false")")
    }
}

// MARK: - Author
public struct WorkAuthor: Codable {
    let author: TypeClass
}

// MARK: - Edition
public struct Edition: OpenLibraryObject {
    public let notes: StringOrDict?
    public let title: String
    public let subtitle: String?
    public let authors: [TypeClass]?
    public let publishDate: String
    public let translatedFrom: [TypeClass]?
    public let covers: [Int]
    public let contributions: [String]?
    public let languages: [TypeClass]?
    public let sourceRecords: [String]?
    public let workTitles: [String]?
    public let translationOf: String?
    public let editionName: String?
    public let subjects: [String]?
    public let publishCountry: String?
    public let byStatement: String?
    public let otherTitles: [String]?
    public let publishers: [String]
    public let physicalFormat: String?
    public let publishPlaces: [String]?
    public let pagination: String?
    public let copyrightDate: String?
    public let subjectTimes: [String]?
    public let key: OpenLibraryKey
    public let numberOfPages: Int
    let works: [TypeClass]
    public let identifiers: Identifiers?
    public let ocaid: String?
    public let isbn10, isbn13, oclcNumbers: [String]?
    public let classifications: Classifications?
    public let deweyDecimalClass: [String]?
    public let latestRevision, revision: Int
    public let created, lastModified: DateValue

    enum CodingKeys: String, CodingKey {
        case notes, title, subtitle, authors
        case publishDate = "publish_date"
        case translatedFrom = "translated_from"
        case covers, contributions, languages
        case sourceRecords = "source_records"
        case workTitles = "work_titles"
        case translationOf = "translation_of"
        case editionName = "edition_name"
        case subjects
        case publishCountry = "publish_country"
        case byStatement = "by_statement"
        case otherTitles = "other_titles"
        case publishers
        case physicalFormat = "physical_format"
        case publishPlaces = "publish_places"
        case pagination
        case copyrightDate = "copyright_date"
        case subjectTimes = "subject_times"
        case key
        case numberOfPages = "number_of_pages"
        case works, identifiers, ocaid
        case isbn10 = "isbn_10"
        case isbn13 = "isbn_13"
        case oclcNumbers = "oclc_numbers"
        case classifications
        case deweyDecimalClass = "dewey_decimal_class"
        case latestRevision = "latest_revision"
        case revision, created
        case lastModified = "last_modified"
    }

    public func getImage(size: String, useDefault: Bool) -> URL? {
        return URL(string: "https://covers.openlibrary.org/b/id/\(self.covers.first ?? 0)-\(size).jpg?default=\(useDefault ? "true" : "false")")
    }
}

// MARK: - Identifiers
public struct Identifiers: Codable {
    let amazon, betterWorldBooks, goodreads, wikidata: [String]?

    enum CodingKeys: String, CodingKey {
        case amazon
        case betterWorldBooks = "better_world_books"
        case goodreads, wikidata
    }
}

// MARK: - TableOfContent
public struct TableOfContent: Codable {
    let level: Int
    let label, title, pagenum: String
}

// MARK: - Classifications
public struct Classifications: Codable {
}

// MARK: - Edition
public struct Editions: Codable {
    let size: Int
    let entries: [EditionsEntry]
}

// MARK: - Contributor
public struct Contributor: Codable {
    let role, name: String
}

// MARK: - EditionsEntry
public struct EditionsEntry: OpenLibraryObject {
    let title: String
    let authors: [TypeClass]?
    let publishDate: String?
    let sourceRecords: [String]?
    let publishers: [String]?
    let isbn10, isbn13: [String]?
    let physicalFormat, fullTitle, subtitle: String?
    let notes: StringOrDict?
    let covers: [Int]?
    let works: [TypeClass]
    public let key: OpenLibraryKey
    let latestRevision, revision: Int
    let created, lastModified: DateValue
    let identifiers: Identifiers?
    let localID: [String]?
    let numberOfPages: Int?
    let classifications: Classifications?
    let languages: [TypeClass]?
    let copyrightDate, translationOf: String?
    let translatedFrom: [TypeClass]?
    let editionName, pagination, ocaid: String?
    let oclcNumbers, series: [String]?
    let contributors: [Contributor]?
    let subjects: [String]?
    let weight: String?
    let otherTitles, publishPlaces: [String]?
    let description: StringOrDict?
    let lcClassifications, contributions, workTitles, deweyDecimalClass: [String]?
    let subjectPeople: [String]?
    let publishCountry, byStatement: String?
    let subjectTimes: [String]?
    let tableOfContents: [TableOfContent]?
    let physicalDimensions: String?
    let lccn: [String]?

    enum CodingKeys: String, CodingKey {
        case title, authors
        case publishDate = "publish_date"
        case sourceRecords = "source_records"
        case publishers
        case isbn10 = "isbn_10"
        case isbn13 = "isbn_13"
        case physicalFormat = "physical_format"
        case fullTitle = "full_title"
        case subtitle, notes, covers, works, key
        case latestRevision = "latest_revision"
        case revision, created
        case lastModified = "last_modified"
        case identifiers
        case localID = "local_id"
        case numberOfPages = "number_of_pages"
        case classifications, languages
        case copyrightDate = "copyright_date"
        case translationOf = "translation_of"
        case translatedFrom = "translated_from"
        case editionName = "edition_name"
        case pagination, ocaid
        case oclcNumbers = "oclc_numbers"
        case series, contributors, subjects, weight
        case otherTitles = "other_titles"
        case publishPlaces = "publish_places"
        case description
        case lcClassifications = "lc_classifications"
        case contributions
        case workTitles = "work_titles"
        case deweyDecimalClass = "dewey_decimal_class"
        case subjectPeople = "subject_people"
        case publishCountry = "publish_country"
        case byStatement = "by_statement"
        case subjectTimes = "subject_times"
        case tableOfContents = "table_of_contents"
        case physicalDimensions = "physical_dimensions"
        case lccn
    }
}
