//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct SubjectsAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func subject(_ subject: String,
                        publishedLowestYear: String? = nil,
                        publishedHighestYear: String? = nil) async throws -> Subject {
        var params = ""
        if publishedLowestYear != nil && publishedHighestYear != nil {
            params = "?published_in=\(publishedLowestYear!)-\(publishedHighestYear!)"
        }
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/subjects/\(subject).json\(params)", type: Subject.self, completion: { result in
                continuation.resume(with: result)
            })
        })
    }
}

