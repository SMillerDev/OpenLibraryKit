//
//  File.swift
//  
//
//  Created by Sean Molenaar on 25/06/2023.
//

import Foundation

public struct Change: Codable {
    let id: String
    let kind: String
    let author: TypeClass?
    let ipAddress: String?
    let timestamp: String
    let comment: String

    enum CodingKeys: String, CodingKey {
        case id, kind, author, timestamp, comment
        case ipAddress = "ip"
    }
}
