//
//  HomeViewModel.swift
//  cit-book-seeker-ios-dojo
//
//  Created by Zied on 11/12/19.
//  Copyright © 2019 ioasys. All rights reserved.
//

import Foundation
import UIKit

public class HomeViewModel {
    
    //MARK: - Properties
    
    public var booksResponse: [BookModel]? {
        didSet {
            guard let response = booksResponse else { return }
            delegate?.getBooksResponse(resultResponse: response)
        }
    }
    
    var delegate: HomeViewModelDelegate?

    //MARK: - Initializers
    
    public init() {
        
    }
    
    //MARK: - Business logic
    
    public func viewDidLoad() {
        ApiRequests.instance.getAllBooks { (success, data) in
            if success {
                guard let unwrapedData = data else {return}
                guard let jsonString = String(data: unwrapedData, encoding: .utf8) else {return}
                guard let jsonData = jsonString.data(using: .utf8) else { return }
                
                do {
                    let books = try JSONDecoder().decode(BooksResponse.self, from: jsonData)
                    guard let booksResp = books.results else { return }
                    self.booksResponse = booksResp
                } catch let error as NSError {
                    print("json parse error: \(error.localizedDescription)")
                }
            } else {
                print("Network service error")
            }
        }
    }
    
}
