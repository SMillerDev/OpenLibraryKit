//
//  File.swift
//  
//
//  Created by Sean Molenaar on 13/06/2023.
//

import Foundation

// MARK: - Work
public struct Work: Codable {
    let description: String?
    let links: [Link] = []
    let title: String
    let covers: [Int]
    let firstSentence: Value?
    let subjectPlaces: [String] = []
    let firstPublishDate: String?
    let subjectPeople: [String] = []
    let key: String
    let authors: [WorkAuthor]
    let excerpts: [Excerpt]
    let subjects: [String]
    let location: String
    let latestRevision, revision: Int
    let created, lastModified: Value

    enum CodingKeys: String, CodingKey {
        case description, links, title, covers
        case firstSentence = "first_sentence"
        case subjectPlaces = "subject_places"
        case firstPublishDate = "first_publish_date"
        case subjectPeople = "subject_people"
        case key, authors, excerpts, subjects, location
        case latestRevision = "latest_revision"
        case revision, created
        case lastModified = "last_modified"
    }
}

// MARK: - Author
struct WorkAuthor: Codable {
    let author: TypeClass
}

// MARK: - Edition
public struct Edition: Codable {
    let notes: String?
    let title: String
    let subtitle: String?
    let authors: [TypeClass]
    let publishDate: String
    let translatedFrom: [TypeClass]?
    let covers: [Int]
    let contributions: [String]?
    let languages: [TypeClass]
    let sourceRecords: [String]
    let workTitles: [String]?
    let translationOf: String?
    let editionName: String
    let subjects: [String]?
    let publishCountry: String?
    let byStatement: String?
    let type: TypeClass
    let otherTitles: [String]?
    let publishers: [String]
    let physicalFormat: String
    let publishPlaces: [String]
    let pagination, copyrightDate: String
    let subjectTimes: [String]?
    let key: String
    let numberOfPages: Int
    let works: [TypeClass]
    let identifiers: Identifiers
    let ocaid: String
    let isbn10, isbn13, oclcNumbers: [String]
    let classifications: Classifications
    let deweyDecimalClass: [String]?
    let latestRevision, revision: Int
    let created, lastModified: Value

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
        case type
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
}

// MARK: - Identifiers
struct Identifiers: Codable {
    let amazon, betterWorldBooks, goodreads, wikidata: [String]?

    enum CodingKeys: String, CodingKey {
        case amazon
        case betterWorldBooks = "better_world_books"
        case goodreads, wikidata
    }
}

// MARK: - TableOfContent
struct TableOfContent: Codable {
    let level: Int
    let label, title, pagenum: String
}

// MARK: - Classifications
struct Classifications: Codable {
}

// MARK: - Edition
struct Editions: Codable {
    let size: Int
    let entries: [EditionsEntry]
}

// MARK: - Contributor
struct Contributor: Codable {
    let role, name: String
}

// MARK: - EditionsEntry
public struct EditionsEntry: Codable {
    let title: String
    let authors: [TypeClass]?
    let publishDate: String?
    let sourceRecords, publishers, isbn10, isbn13: [String]?
    let physicalFormat, fullTitle, subtitle: String?
    let notes: Description?
    let covers: [Int]?
    let works: [TypeClass]
    let key: String
    let latestRevision, revision: Int
    let created, lastModified: Value
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
    let description: Description?
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
