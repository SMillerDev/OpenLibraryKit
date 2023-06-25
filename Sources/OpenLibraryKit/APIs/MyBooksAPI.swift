//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct MyBooksAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd, HH:mm:ss"
        self.api.decoder.dateDecodingStrategy = .formatted(dateFormatter)
    }

    public func wanted(user: String) async throws -> [ReadingLogEntry] {
        return try await self.callApi(user: user, path: "want-to-read")
    }

    public func reading(user: String) async throws -> [ReadingLogEntry] {
        return try await self.callApi(user: user, path: "currently-reading")
    }

    public func read(user: String) async throws -> [ReadingLogEntry] {
        return try await self.callApi(user: user, path: "already-read")
    }

    public func callApi(user: String, path: String) async throws -> [ReadingLogEntry] {
        try await withCheckedThrowingContinuation({ continuation in
            api.request(path: "/people/\(user)/books/\(path).json", type: ReadingLog.self, completion: { result in
                switch result {
                case .success(let json):
                    continuation.resume(returning: json.readingLogEntries)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            })
        })
    }
}
