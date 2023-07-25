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

    public func work(id: OpenLibraryID) async throws -> Work {
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

    public func edition(id: OpenLibraryID) async throws -> Edition {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/books/\(id).json", type: Edition.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }

    public func editions(id: OpenLibraryID) async throws -> [EditionsEntry] {
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

    public func ratings(id: OpenLibraryID) async throws -> BookRating {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/works/\(id)/ratings.json", type: BookRating.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }

    public func setRating(id: OpenLibraryID, rating: Int) async throws -> BookRating {
        if rating > 5 || rating < 1 {
            throw HttpError.clientError("Invalid rating")
        }

        let ratingRequest: RatingRequest = RatingRequest(editionId: id, rating: rating)

        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/works/\(id)/ratings.json",
                        type: BookRating.self,
                        method: .post,
                        data: try? JSONEncoder().encode(ratingRequest),
                        completion: { result in
                continuation.resume(with: result)
            })
        })
    }

    public func shelves(id: OpenLibraryID) async throws -> BookShelves {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/works/\(id)/bookshelves.json", type: BookShelves.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }

    public func setShelve(id: OpenLibraryID, shelf: BookShelveId) async throws {
        throw HttpError.notImplemented
    }

    public func removeShelve(id: OpenLibraryID, shelf: BookShelveId) async throws {
        throw HttpError.notImplemented
    }

    public func image(id: OpenLibraryID) async throws -> Cover {
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

public enum BookShelveId: Int {
    case wantToRead = 1
    case reading = 2
    case read = 3
}

public struct RatingRequest: Encodable {
    let editionId: String
    let rating: Int
    let redir: Bool = false
    let ajax: Bool = false
}
