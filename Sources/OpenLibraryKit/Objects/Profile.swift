//
//  File.swift
//  
//
//  Created by Sean Molenaar on 13/06/2023.
//

import Foundation

// MARK: - Profile
public struct Profile: OpenLibraryObject {
    public let key: OpenLibraryKey
    let displayname: String
    let latestRevision, revision: Int
    let created, lastModified: DateValue

    enum CodingKeys: String, CodingKey {
        case key, displayname
        case revision, created
        case latestRevision = "latest_revision"
        case lastModified = "last_modified"
    }
}
