//
//  File.swift
//  
//
//  Created by Sean Molenaar on 25/06/2023.
//

import Foundation

public struct Subject: Codable {
    let key: String
    let name: String
    let type: String?
    let workCount: Int
    let works: [SubjectWork]

    enum CodingKeys: String, CodingKey {
        case name, key, works
        case type = "subject_type"
        case workCount = "work_count"
    }
}

public struct SubjectWork: Codable {
    let key: String
    let title: String
    let fullText: Bool
    let lending: Bool
    let editionCount: Int
    let coverId: Int
    let coverEdition: String
    let authors: [AuthorValue]
    let subject: [String]
    let iaCollection: [String]

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
