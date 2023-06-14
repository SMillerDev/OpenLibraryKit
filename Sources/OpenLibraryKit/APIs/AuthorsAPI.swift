//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct AuthorsAPI {
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

    public func works(id: String, completion: @escaping (Array<AuthorWork>?) -> Void) -> Void {
        api.request(path: "/authors/\(id)/works.json", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                completion(nil)
            }

            do {
                let json = try JSONDecoder().decode(AuthorWorks.self, from: data!)
                completion(json.entries)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion(nil)
            }
        })
    }

    public func search(query: String, completion: @escaping (Array<AuthorSearchResult>) -> Void) -> Void {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        api.request(path: "/search/authors.json?q=\(encodedQuery)", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                completion([])
            }

            do {
                let json = try JSONDecoder().decode(AuthorSearch.self, from: data!)
                completion(json.docs)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion([])
            }
        })
    }

    public func image(id: String, completion: @escaping (Cover?) -> Void) -> Void {
        api.request(path: "/a/olid/\(id).json", prefix: "covers.", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                completion(nil)
            }

            do {
                let json = try JSONDecoder().decode(Cover.self, from: data!)
                completion(json)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion(nil)
            }
        })
    }
}

