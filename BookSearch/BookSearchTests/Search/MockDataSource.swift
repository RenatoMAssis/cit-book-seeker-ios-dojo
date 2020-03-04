//
//  MockDataSource.swift
//  BookSearchTests
//
//  Created by Pericles Junor on 03/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit
@testable import BookSearch

open class MockDataSource: APIRequestsProtocol {
    
    let validResponse = [["Book":"First book"], ["Book":"Second book"]]
    
    public func searchBook(term: String, completion: @escaping ([[String : Any]]?, Error?) -> Void) {
        if term == "it is a book name" {
            completion(validResponse, nil)
        } else {
            completion(nil, NSError(domain:"", code: 503, userInfo:nil))
        }
    }
    
}
