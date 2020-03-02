//
//  ResultViewModel.swift
//  BookSearch
//
//  Created by Pericles Junor on 29/02/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class ResultViewModel: ResultViewModelProtocol {

    private let view: ResultViewControllerProtocol!

    public let searchResult: [Book]!

    init(view: ResultViewControllerProtocol, searchResult: [Book]) {
        self.view = view
        self.searchResult = searchResult
    }

    func reloadTableView() {
        //
    }

    func resultCount() -> Int {
        return searchResult.count
    }

    func getBookBy(index: Int) -> Book {
        return searchResult[index]
    }
}
