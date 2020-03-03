//
//  DetailViewModel.swift
//  BookSearch
//
//  Created by Pericles Junor on 02/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

protocol DetailViewModelProtocol {
    func setupDataOnView()
    func bookTitle() -> String
}

class DetailViewModel: DetailViewModelProtocol {

    private let view: DetailViewControllerProtocol!
    private let book: Book!

    init(view: DetailViewControllerProtocol, book: Book) {
        self.view = view
        self.book = book
    }

    func setupDataOnView() {
        view.setupBookdata(title: book.title,
                           author: book.author,
                           kind: book.kind,
                           description: book.description)
    }

    func bookTitle() -> String {
        return book.title
    }
}
