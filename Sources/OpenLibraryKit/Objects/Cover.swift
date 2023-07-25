//
//  File.swift
//  
//
//  Created by Sean Molenaar on 14/06/2023.
//

import Foundation

// MARK: - Cover
public struct Cover: Codable {
    let coverId: Int
    let categoryID: Int
    let olid: String
    let filename: String
    let author: String?
    let sourceIp: String
    let source: String?
    public let sourceURL: URL?
    let isbn: String?
    let created: String
    let lastModified: String
    let archived: Bool
    let width, height: Int?
    let filenameS, filenameM, filenameL: String
    let isbn13: String?

    enum CodingKeys: String, CodingKey {
        case coverId = "id"
        case sourceIp = "ip"
        case categoryID = "category_id"
        case olid, filename, author
        case sourceURL = "source_url"
        case source, isbn, created
        case lastModified = "last_modified"
        case archived, width, height
        case filenameS = "filename_s"
        case filenameM = "filename_m"
        case filenameL = "filename_l"
        case isbn13
    }
}
