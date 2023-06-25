//
//  File.swift
//  
//
//  Created by Sean Molenaar on 25/06/2023.
//

import Foundation

// MARK: - Link
struct Link: Codable {
    let title: String?
    let url: String
}

// MARK: - TypeClass
struct TypeClass: Codable {
    let key: String
}

enum TypeEnum: String, Codable {
    case typeDatetime = "/type/datetime"
    case typeText = "/type/text"
}

// MARK: - Permission
struct DateValue: Codable {
    let type: TypeEnum
    let value: Date?
}

struct StringValue: Codable {
    let type: String
    let value: String?
}

struct AuthorValue: Codable {
    let key: String
    let name: String?
}
