//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct SearchContentAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func search(_ query: String,
                       itemId: String,
                       path: String,
                       dataNode: String = "ia800204") async throws -> ContentSearchResult {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return try await withCheckedThrowingContinuation({ continuation in
            let params = "item_id=\(itemId)&doc=\(itemId)&path=\(path)&q=\(encodedQuery)"
            api.request(url: "https://\(dataNode).us.archive.org/fulltext/inside.php?\(params)",
                        type: ContentSearchResult.self,
                        completion: { result in
                continuation.resume(with: result)
            })
        })
    }
}
