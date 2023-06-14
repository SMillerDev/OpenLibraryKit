//
//  File.swift
//  
//
//  Created by Sean Molenaar on 14/06/2023.
//

import Foundation

struct Api {
    internal func request(path: String, prefix: String = "", completion: @Sendable @escaping (Data?, URLResponse?, Error?) -> Void) {
        let url = URL(string: "https://\(prefix)openlibrary.org\(path)")!
        print("📲 GET Request to: \(url.absoluteString)")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: completion)

        task.resume()
    }
}
