//
//  DetailsViewModel.swift
//  BookSeeker
//
//  Created by André Alves on 11/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import Foundation

class DetailsViewModel {
    let view: DetailsViewController
    let book: Book
    init(view: DetailsViewController, book: Book) {
        self.view = view
        self.book = book
        self.view.delegate = self
    }
}

// MARK: - DetailsViewControllerDelegate

extension DetailsViewModel: DetailsViewControllerDelegate {
    func didLoad() {
        guard let url = URL(string: book.artworkUrl100) else {
            return
        }
        view.configureView(with: url, and: book.trackName, and: book.description, and: book.averageUserRating ?? 0.0, and: book.artistName)
    }
}
