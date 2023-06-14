//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct SearchContentAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func author(id: String, completion: @escaping (Author?) -> Void) -> Void {
        api.request(path: "/authors/\(id).json", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                completion(nil)
            }

            do {
                let json = try JSONDecoder().decode(Author.self, from: data!)
                completion(json)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion(nil)
            }
        })
    }
}
