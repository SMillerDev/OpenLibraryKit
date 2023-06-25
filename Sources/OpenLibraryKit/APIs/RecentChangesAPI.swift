//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct RecentChangesAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api

        self.api.decoder.dateDecodingStrategy = .iso8601
    }

    public func changes(type: ChangesType? = nil,
                        year: String? = nil,
                        month: String? = nil,
                        day: String? = nil) async throws -> [Change] {
        var url = "recentchanges"
        if year != nil {
            url += "/\(year!)"
        }
        if month != nil {
            url += "/\(month!)"
        }
        if day != nil {
            url += "/\(day!)"
        }
        if type != nil {
            url += "/\(type!.rawValue)"
        }
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/\(url).json", type: Array<Change>.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }
}

public enum ChangesType: String {
    case addCover = "add-cover"
    case addBook = "add-book"
    case editBook = "edit-book"
    case mergeAuthors = "merge-authors"
    case update = "update"
    case revert = "revert"
    case newAccount = "new-account"
    case register = "register"
    case lists = "lists"
}
