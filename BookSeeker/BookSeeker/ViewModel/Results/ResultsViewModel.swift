//
//  ResultsViewModel.swift
//  BookSeeker
//
//  Created by André Alves on 10/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit

class ResultsViewModel {
    let view: ResultsViewController
    let delegate: ResultsViewModelDelegate
    let books: [Book]
    init(view: ResultsViewController, books: [Book], delegate: ResultsViewModelDelegate) {
        self.view = view
        self.books = books
        self.delegate = delegate
        self.view.delegate = self
    }
}
// MARK: - ResultsViewControllerDelegate
extension ResultsViewModel: ResultsViewControllerDelegate {
    func goToDetails(with row: Int) {
        delegate.goToDetails(with: books[row])
    }
    func numberOfRows() -> Int {
        return books.count
    }
    func cellForRow(with row: Int) -> (imageURL: String, title: String) {
        return (imageURL: books[row].artworkUrl100, title: books[row].trackName)
    }
    func getArtwork(with imageURL: URL, completion: @escaping ImageCompletionBlock) {
        API.shared.getArtwork(with: imageURL) { (image, error) in
            completion(image, error)
        }
    }
}
