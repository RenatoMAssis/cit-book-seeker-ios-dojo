//
//  SearchBookViewModel.swift
//  BookSeeker
//
//  Created by André Alves on 10/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit

class SearchBookViewModel {
    let view: SearchBookViewController
    var delegate: SearchBookViewModelDelegate!
    init(view: SearchBookViewController, delegate: SearchBookViewModelDelegate) {
        self.view = view
        self.delegate = delegate
        self.view.delegate = self
    }
}

// MARK: - SearchBookViewControllerDelegate
extension SearchBookViewModel: SearchBookViewControllerDelegate {
    func doSearch(with term: String) {
        API.shared.getBooks(by: term) { (books, error) in
            if error == nil, let books = books {
                self.delegate.goToResults(with: books)
            } else {
                self.delegate.showError(title: "Error", message: error?.localizedDescription ?? "")
            }
        }
    }
}
