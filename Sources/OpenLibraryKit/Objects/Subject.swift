//
//  File.swift
//  
//
//  Created by Sean Molenaar on 25/06/2023.
//

import Foundation

public struct Subject: OpenLibraryObject {
    public let key: OpenLibraryKey
    public let name: String
    let type: String?
    public let workCount: Int
    public let works: [SubjectWork]

    enum CodingKeys: String, CodingKey {
        case name, key, works
        case type = "subject_type"
        case workCount = "work_count"
    }
}

public struct SubjectWork: OpenLibraryObject {
    public let key: OpenLibraryKey
    public let title: String
    public let fullText: Bool
    public let lending: Bool
    public let editionCount: Int
    public let coverId: Int
    public let coverEdition: String
    public let authors: [AuthorValue]
    public let subject: [String]
    public let iaCollection: [String]

    enum CodingKeys: String, CodingKey {
        case title, key, authors, subject
        case fullText = "has_fulltext"
        case coverId = "cover_id"
        case coverEdition = "cover_edition_key"
        case editionCount = "edition_count"
        case iaCollection = "ia_collection"
        case lending = "lendinglibrary"
    }
}
