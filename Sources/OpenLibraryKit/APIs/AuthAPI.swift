//
//  File.swift
//  
//
//  Created by Sean Molenaar on 14/06/2023.
//

import Foundation

public struct AuthAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func login(user: String, secret: String) async throws -> String {
        return try await loginCall(user: user, secret: secret)
    }

    private func loginCall(user: String, secret: String) async throws -> String {
        let url = URL(string: "https://openlibrary.org/account/login")!
        print("📲 POST Request to: \(url.absoluteString)")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "access=\(user)&secret=\(secret)".data(using: .utf8)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let (_, response) = try await URLSession.shared.data(for: request)
        if let response = response as? HTTPURLResponse, response.statusCode > 299 || response.statusCode < 199 {
            throw AuthError.invalidCredentials
        }

        return user
    }
}

enum AuthError: Error {
    case invalidCredentials
}
