//
//  File.swift
//  
//
//  Created by Sean Molenaar on 25/06/2023.
//

import Foundation

public struct ReadingResults: Codable {
    let items: [ReadingItem]
    let records: [String: ReadingRecord]
}

struct ReadingRecord: Codable {
    let isbns: [String]
    let issns: [String]
    let lccns: [String]
    let oclcs: [String]
    let olids: [String]
    let publishDates: [String]
    let recordURL: URL
}

struct ReadingItem: Codable {
    let match: String
    let status: String
    let fromRecord: String
    let editionId: String
    let workId: String
    let publishDate: String
    let contributor: String
    let url: URL
    let cover: ReadingItemCover

    enum CodingKeys: String, CodingKey {
        case match, status, fromRecord, publishDate, contributor, cover
        case url = "itemURL"
        case workId = "ol-work-id"
        case editionId = "ol-edition-id"
    }
}

struct ReadingItemCover: Codable {
    let small: URL
    let medium: URL
    let large: URL
}
