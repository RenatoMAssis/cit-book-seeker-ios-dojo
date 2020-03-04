//
//  APIRequests.swift
//  BookSearch
//
//  Created by Pericles Junor on 01/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class APIRequests: APIRequestsProtocol {

    func searchBook(term: String, completion: @escaping ([[String: Any]]?, Error?) -> Void) {
        if var urlComponents = URLComponents(string: Constant.baseUrl) {

            urlComponents.query = "term=\(term)&entity=ibook"

            guard let url = urlComponents.url else { return }

            let request = URLRequest(url: url)

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, let response = response as? HTTPURLResponse,
                    (200 ..< 300) ~= response.statusCode, error == nil else {
                        completion(nil, error) // Error on request
                        return
                }
                do {
                    let responseJson = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                    if let booksData = responseJson?["results"] as? [[String: Any]] {
                        completion(booksData, nil)
                    }
                } catch {
                    completion(nil, nil) // Error on json serialization
                }
            }
            task.resume()
        }
    }
}
