//
//  HomeViewControllerDelegate.swift
//  cit-book-seeker-ios-dojo
//
//  Created by Zied on 11/12/19.
//  Copyright © 2019 ioasys. All rights reserved.
//

import Foundation

public protocol HomeViewModelDelegate: AnyObject {
    func getBooksResponse(resultResponse: [BookModel])
}
