//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct ReadAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func fetch(id: String, type: ReadableType) async throws -> ReadingResults {
        return try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/api/volumes/brief/\(type.rawValue)/\(id).json",
                        type: ReadingResults.self,
                        completion: { result in
                continuation.resume(with: result)
            })
        })
    }
}

public enum ReadableType: String {
    case isbn = "isbn"
    case openLibraryId = "olid"
    case oclc = "oclc"
    case libraryOfCongressControl = "lccn"
}
