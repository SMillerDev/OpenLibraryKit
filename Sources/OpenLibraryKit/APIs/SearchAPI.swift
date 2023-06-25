//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct SearchAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func search(_ query: String) async throws -> [SearchResult] {
        return try await withCheckedThrowingContinuation({ continuation in
            let encodedQuery = query.replacingOccurrences(of: " ", with: "+")
                                    .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            api.request(path: "/search.json?q=\(encodedQuery)", type: SearchResults.self, completion: { result in
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
