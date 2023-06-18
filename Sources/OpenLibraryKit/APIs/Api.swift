//
//  File.swift
//  
//
//  Created by Sean Molenaar on 14/06/2023.
//

import Foundation

struct Api {
    internal func request<T: Decodable>(path: String,
                                        prefix: String = "",
                                        type: T.Type,
                                        completion: @escaping (Result<T, Error>) -> Void) {
        let url = URL(string: "https://\(prefix)openlibrary.org\(path)")!
        print("📲 GET Request to: \(url.absoluteString)")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(HttpError.invalidResponse("Response is not a HTTP Response")))
                return
            }
            if response.statusCode >= 400 && response.statusCode < 500 {
                completion(.failure(HttpError.clientError("Client request error")))
                return
            }
            if response.statusCode >= 500 && response.statusCode < 600 {
                completion(.failure(HttpError.serverError("Serverside error")))
                return
            }

            guard let data = data else {
                completion(.failure(HttpError.noResponseData("Response has no data")))
                return
            }

            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch {
                print("❌ Failed to decode data. Error: \(error)")
                completion(.failure(error))
            }
        }).resume()
    }
}

enum HttpError: Error {
    case serverError(String)
    case clientError(String)
    case invalidResponse(String)
    case noResponseData(String)
}
