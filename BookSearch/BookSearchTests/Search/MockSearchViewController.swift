//
//  MockSearchViewController.swift
//  BookSearchTests
//
//  Created by Pericles Junor on 03/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit
@testable import BookSearch

open class MockSearchViewController: SearchViewControllerProtocol {

    var reloadedTableView: Bool = false
    var presentedAlert: Bool = false
    var pushedController: Bool = false

    public func reloadTableView() {
        reloadedTableView = true
    }

    public func pushSearchResult(controller: ResultViewController) {
        pushedController = true
    }

    public func showAlert(title: String, message: String) {
        presentedAlert = true
    }
}
