//
//  File.swift
//  
//
//  Created by Sean Molenaar on 13/06/2023.
//

import Foundation

// MARK: - Profile
public struct Profile: Codable {
    let key: String
    let displayname: String
    let latestRevision, revision: Int
    let created, lastModified: Value

    enum CodingKeys: String, CodingKey {
        case key, displayname
        case latestRevision = "latest_revision"
        case revision, created
        case lastModified = "last_modified"
    }
}

// MARK: - Permission
struct Value: Codable {
    let type: String
    let value: String?
}
