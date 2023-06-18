//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct BooksAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func work(id: String) async throws -> Work {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/works/\(id).json", type: Work.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }

    public func edition(isbn: String) async throws -> Edition {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/isbn/\(isbn).json", type: Edition.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }

    public func edition(id: String) async throws -> Edition {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/books/\(id).json", type: Edition.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }

    public func editions(id: String) async throws -> [EditionsEntry] {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/works/\(id)/editions.json?limit=1000", type: Editions.self, completion: { result in
                switch result {
                case .success(let json):
                    continuation.resume(returning: json.entries)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            })
        })
    }

    public func ratings(id: String) async throws -> BookRating {
        return try await withCheckedThrowingContinuation({ continuation in
        api.request(path: "/works/\(id)/ratings.json", type: BookRating.self, completion: { result in
            continuation.resume(with: result)
        })
        })
    }

    public func shelves(id: String) async throws -> BookShelves {
        return try await withCheckedThrowingContinuation({ continuation in
        api.request(path: "/works/\(id)/bookshelves.json", type: BookShelves.self, completion: { result in
            continuation.resume(with: result)
        })
        })
    }

    public func image(id: String) async throws -> Cover {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/b/olid/\(id).json", prefix: "covers.", type: Cover.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }

    public func image(isbn: String) async throws -> Cover {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/b/isbn/\(isbn).json", prefix: "covers.", type: Cover.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }
}
