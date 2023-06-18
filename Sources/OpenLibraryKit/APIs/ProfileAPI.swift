//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct ProfileAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func get(user: String) async throws -> Profile {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/people/\(user).json", type: Profile.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }
}
