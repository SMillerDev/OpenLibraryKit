//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct ListsAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func listFor(user: String) async throws -> [List] {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/people/\(user)/lists.json", type: Lists.self, completion: { result in
                switch result {
                case .success(let json):
                    continuation.resume(returning: json.entries)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            })
        })
    }

    public func listFor(subject: ListSeedType, id: String) async throws -> [List] {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/\(subject.rawValue)/\(id)/lists.json", type: Lists.self, completion: { result in
                switch result {
                case .success(let json):
                    continuation.resume(returning: json.entries)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            })
        })
    }

    public func single(user: String, id: String) async throws -> SingleList {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/people/\(user)/lists/\(id).json", type: SingleList.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }

    public func search(_ query: String) async throws -> [List] {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/search/lists.json?limit=100&q=\(encodedQuery)",
                        type: ListSearch.self,
                        completion: { result in
                switch result {
                case .success(let json):
                    continuation.resume(returning: json.docs)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            })
        })
    }
}

public enum ListSeedType: String {
    case books
    case works
    case authors
    case subjects
}
