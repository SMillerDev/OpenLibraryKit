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
    
    public func get(user: String? = nil, completion: @escaping (Profile?) -> Void) -> Void {
        guard let username = user else {
            return
        }
        
        api.request(path: "/people/\(username).json", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                completion(nil)
            }

            do {
                let json = try JSONDecoder().decode(Profile.self, from: data!)
                completion(json)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion(nil)
            }
        })
    }
}
