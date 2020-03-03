//
//  BookCellViewModel.swift
//  BookSearch
//
//  Created by Pericles Junor on 01/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit
import SDWebImage

protocol BookCellViewModelProtocol {
    func setupCell()
}

class BookCellViewModel: BookCellViewModelProtocol {

    private let view: BookTableViewCellProtocol!
    private let book: Book!

    init(view: BookTableViewCellProtocol, book: Book) {
        self.book = book
        self.view = view
        setupCell()
    }

    func setupCell() {
        view.setupCell(title: book.title, pictureURL: book.artwork)
    }
}
