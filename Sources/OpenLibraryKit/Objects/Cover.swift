//
//  File.swift
//  
//
//  Created by Sean Molenaar on 14/06/2023.
//

import Foundation

// MARK: - Cover
public struct Cover: Codable {
    let id, categoryID: Int
    let olid, filename: String
    let author: String?
    let ip: String
    let source, sourceURL: String?
    let isbn: String?
    let created, lastModified: String
    let archived, deleted: Bool
    let width, height: Int?
    let filenameS, filenameM, filenameL: String
    let isbn13: String?

    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "category_id"
        case olid, filename, author, ip
        case sourceURL = "source_url"
        case source, isbn, created
        case lastModified = "last_modified"
        case archived, deleted, width, height
        case filenameS = "filename_s"
        case filenameM = "filename_m"
        case filenameL = "filename_l"
        case isbn13
    }
}
