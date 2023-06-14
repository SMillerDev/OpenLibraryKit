//
//  File.swift
//  
//
//  Created by Sean Molenaar on 12/06/2023.
//

import Foundation

public struct BooksAPI {
    let api: Api

    init(_ api: Api) {
        self.api = api
    }

    public func work(id: String, completion: @escaping (Work?) -> Void) -> Void {
        api.request(path: "/works/\(id).json", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                completion(nil)
            }

            do {
                let json = try JSONDecoder().decode(Work.self, from: data!)
                completion(json)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion(nil)
            }
        })
    }

    public func edition(isbn: String, completion: @escaping (Edition?) -> Void) -> Void {
        api.request(path: "/isbn/\(isbn).json", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                completion(nil)
            }

            do {
                let json = try JSONDecoder().decode(Edition.self, from: data!)
                completion(json)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion(nil)
            }
        })
    }

    public func edition(id: String, completion: @escaping (Edition?) -> Void) -> Void {
        api.request(path: "/books/\(id).json", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                completion(nil)
            }

            do {
                let json = try JSONDecoder().decode(Edition.self, from: data!)
                completion(json)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion(nil)
            }
        })
    }

    public func editions(id: String, completion: @escaping (Array<EditionsEntry>?) -> Void) -> Void {
        api.request(path: "/works/\(id)/editions.json?limit=1000", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                completion(nil)
            }

            do {
                let json = try JSONDecoder().decode(Editions.self, from: data!)
                completion(json.entries)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion(nil)
            }
        })
    }

    public func ratings(id: String, completion: @escaping (BookRating?) -> Void) -> Void {
        api.request(path: "/works/\(id)/ratings.json", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                completion(nil)
            }

            do {
                let json = try JSONDecoder().decode(BookRating.self, from: data!)
                completion(json)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion(nil)
            }
        })
    }

    public func shelves(id: String, completion: @escaping (BookShelves?) -> Void) -> Void {
        api.request(path: "/works/\(id)/bookshelves.json", completion: { data, response, error -> Void in
            if error != nil, data == nil {
                completion(nil)
            }

            do {
                let json = try JSONDecoder().decode(BookShelves.self, from: data!)
                completion(json)
            } catch {
                print("Failed to decode data. Error: \(error)")
                completion(nil)
            }
        })
    }

    public func image(id: String, completion: @escaping (Cover?) -> Void) -> Void {
        api.request(path: "/b/olid/\(id).json", prefix: "covers.", completion: { data, response, error -> Void in
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

    public func image(isbn: String, completion: @escaping (Cover?) -> Void) -> Void {
        api.request(path: "/b/isbn/\(isbn).json", prefix: "covers.", completion: { data, response, error -> Void in
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
