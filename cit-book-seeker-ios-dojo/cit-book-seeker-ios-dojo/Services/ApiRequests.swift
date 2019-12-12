//
//  ApiRequests.swift
//  cit-book-seeker-ios-dojo
//
//  Created by ioasys on 11/12/19.
//  Copyright © 2019 ioasys. All rights reserved.
//

import Foundation

public class ApiRequests {
    
    static let instance = ApiRequests()
    
    public func getAllBooks(completion: @escaping CompletionHandler) {
        if let url = URL(string: BASE_URL) {
           URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    completion(true,data)
                }
           }.resume()
        } else {
            completion(false, nil)
        }
    }
    
}
