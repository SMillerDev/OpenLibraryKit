//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct AuthorsAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func author(id: OpenLibraryID) async throws -> Author {
        try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/authors/\(id).json", type: Author.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }

    public func works(id: OpenLibraryID) async throws -> [AuthorWork] {
        try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/authors/\(id)/works.json", type: AuthorWorks.self, completion: { result in
                switch result {
                case .success(let json):
                    continuation.resume(returning: json.entries)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            })
        })
    }

    public func search(_ query: String) async throws -> [AuthorSearchResult] {
        try await withCheckedThrowingContinuation({ continuation in
            let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            api.request(path: "/search/authors.json?q=\(encodedQuery)", type: AuthorSearch.self, completion: { result in
                switch result {
                case .success(let json):
                    continuation.resume(returning: json.docs)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            })
        })
    }

    public func image(id: OpenLibraryID) async throws -> Cover {
        try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/a/olid/\(id).json", prefix: "covers.", type: Cover.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }
}
