//
//  MockResultViewController.swift
//  BookSearchTests
//
//  Created by Pericles Junor on 03/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit
@testable import BookSearch

open class MockResultViewController: ResultViewControllerProtocol {

    public var reloadedTableView: Bool = false
    public var viewModel: ResultViewModelProtocol?

    init(bookList: [Book]) {
        self.viewModel = ResultViewModel(view: self, searchResult: bookList)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func reloadTableView() {
        reloadedTableView = true
    }
}
