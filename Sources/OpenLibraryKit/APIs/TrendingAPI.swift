//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct TrendingAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func trending(_ target: TrendingCategory) async throws -> [TrendingItem] {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/trending/\(target.rawValue).json", type: TrendingList.self, completion: { result in
                switch result {
                case .success(let json):
                    continuation.resume(returning: json.works)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            })
        })
    }
}

public enum TrendingCategory: String {
    case now = "now"
    case daily = "daily"
    case weekly = "weekly"
    case monthly = "monthly"
    case yearly = "yearly"
    case forever = "forever"
}
