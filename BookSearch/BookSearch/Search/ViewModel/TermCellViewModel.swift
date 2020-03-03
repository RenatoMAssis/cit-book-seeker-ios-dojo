//
//  TermCellViewModel.swift
//  BookSearch
//
//  Created by Pericles Junor on 03/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

protocol TermCellViewModelProtocol {
    func setupCell()
}

class TermCellViewModel: TermCellViewModelProtocol {

    private let view: TermTableViewCellProtocol!
    private let term: String!

    init(view: TermTableViewCellProtocol, term: String) {
        self.term = term
        self.view = view
        setupCell()
    }

    func setupCell() {
        view.setupCell(with: term)
    }
}
