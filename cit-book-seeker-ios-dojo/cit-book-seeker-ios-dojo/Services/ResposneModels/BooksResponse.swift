//
//  BooksResponse.swift
//  cit-book-seeker-ios-dojo
//
//  Created by ioasys on 11/12/19.
//  Copyright © 2019 ioasys. All rights reserved.
//

import Foundation

public class BooksResponse: Codable {
    
    public var resultCount:Int?
    public var results: [BookModel]?
    
    enum CodingKeys: String, CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
    
    init(resultCount:Int,results: [BookModel]) {
        self.resultCount = resultCount
        self.results = results
    }
}
