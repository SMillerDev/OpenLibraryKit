//
//  File.swift
//  
//
//  Created by Sean Molenaar on 14/06/2023.
//

import Foundation

struct Api {

    let decoder: JSONDecoder

    init() {
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601WithFractionalSeconds
    }

    internal func request<T: Decodable>(path: String,
                                        prefix: String = "",
                                        type: T.Type,
                                        method: HttpMethod = .get,
                                        data: Data? = nil,
                                        completion: @escaping (Result<T, Error>) -> Void) {
        let url = URL(string: "https://\(prefix)openlibrary.org\(path)")!
        return request(url: url, type: type, method: method, data: data, completion: completion)
    }

    internal func request<T: Decodable>(url: String,
                                        type: T.Type,
                                        method: HttpMethod = .get,
                                        data: Data? = nil,
                                        completion: @escaping (Result<T, Error>) -> Void) {
        let url = URL(string: url)!
        return request(url: url, type: type, method: method, data: data, completion: completion)
    }

    internal func request<T: Decodable>(url: URL,
                                        type: T.Type,
                                        method: HttpMethod = .get,
                                        data: Data? = nil,
                                        completion: @escaping (Result<T, Error>) -> Void) {
        print("📲 GET Request to: \(url.absoluteString)")
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data

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

//            debugPrint(String(data: data, encoding: .utf8))
            do {
                let json = try decoder.decode(T.self, from: data)
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
    case notImplemented
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

extension Formatter {
    static var customISO8601DateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return formatter
    }()
}

extension JSONDecoder.DateDecodingStrategy {
    static var iso8601WithFractionalSeconds = custom { decoder in
        let dateStr = try decoder.singleValueContainer().decode(String.self)
        let customIsoFormatter = Formatter.customISO8601DateFormatter
        if let date = customIsoFormatter.date(from: dateStr) {
            return date
        }
        throw DecodingError.dataCorrupted(
            DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Invalid date"))
   }
}
