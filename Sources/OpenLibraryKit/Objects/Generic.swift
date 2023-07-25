//
//  File.swift
//  
//
//  Created by Sean Molenaar on 25/06/2023.
//

import Foundation

public typealias OpenLibraryID = String
public typealias OpenLibraryKey = String

// MARK: - Link
public struct LinkItem: Codable {
    public let title: String?
    public let url: URL
}

public protocol OpenLibraryObject: Codable {
    var key: OpenLibraryKey { get }
}

extension OpenLibraryObject {
    public var olid: OpenLibraryID {
        get {
            return String(key.split(separator: "/").last!)
        }
    }
}

// MARK: - TypeClass
public struct TypeClass: OpenLibraryObject {
    public let key: OpenLibraryKey
}

enum TypeEnum: String, Codable {
    case typeDatetime = "/type/datetime"
    case typeText = "/type/text"
}

// MARK: - Permission
public struct DateValue: Codable {
    let type: TypeEnum
    let value: Date?
}

public struct StringValue: Codable {
    public let type: String
    public let value: String?
}

public struct AuthorValue: OpenLibraryObject {
    public let key: OpenLibraryKey
    let name: String?
}
