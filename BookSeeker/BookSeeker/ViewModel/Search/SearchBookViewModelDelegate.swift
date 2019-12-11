//
//  SearchBookViewModelDelegate.swift
//  BookSeeker
//
//  Created by André Alves on 10/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import Foundation

protocol SearchBookViewModelDelegate: ViewModelDelegate {
    func goToResults(with books: [Book] )
}
