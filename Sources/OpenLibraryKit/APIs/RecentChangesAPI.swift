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
    }

    public func author(id: String) async throws -> Author {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/authors/\(id).json", type: Author.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }
}
