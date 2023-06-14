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
    }

    public func wanted(user: String? = nil, completion: @escaping (Array<ReadingLogEntry>?) -> Void) -> Void {
        return self.callApi(user: user, path: "want-to-read", completion: completion)
    }


    public func reading(user: String? = nil, completion: @escaping (Array<ReadingLogEntry>?) -> Void) -> Void {
        return self.callApi(user: user, path: "currently-reading", completion: completion)
    }


    public func read(user: String? = nil, completion: @escaping (Array<ReadingLogEntry>?) -> Void) -> Void {
        return self.callApi(user: user, path: "already-read", completion: completion)
    }

    public func callApi(user: String? = nil, path: String, completion: @escaping (Array<ReadingLogEntry>?) -> Void) -> Void {
        guard let username = user else {
            return
        }
        
        api.request(path: "/people/\(username)/books/\(path).json", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                print("Failed to fetch data. Error: \(error?.localizedDescription ?? "None")")
                completion(nil)
            }

            do {
                let json = try JSONDecoder().decode(ReadingLog.self, from: data!)
                completion(json.readingLogEntries)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion(nil)
            }
        })
    }
}
