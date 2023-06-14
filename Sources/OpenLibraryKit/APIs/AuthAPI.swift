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
    
    public func login(user: String, secret: String) -> Void {
        let url = URL(string: "https://openlibrary.org/account/login")!
        print("📲 POST Request to: \(url.absoluteString)")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "access=\(user)&secret=\(secret)".data(using: .utf8)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data,response,error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let response = response as? HTTPURLResponse, response.statusCode > 299 || response.statusCode < 199 {
                print("NO!")
            }
            debugPrint(response)
//            debugPrint(String(data: data!, encoding: .utf8))
        })

        task.resume()
    }
}
