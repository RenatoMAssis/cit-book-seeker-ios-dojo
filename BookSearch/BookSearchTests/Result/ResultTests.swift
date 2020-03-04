//
//  ResultTests.swift
//  BookSearchTests
//
//  Created by Pericles Junor on 04/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import XCTest
@testable import BookSearch

class ResultTests: XCTestCase {

    func testSuccessfilInitResultViewController() {
        XCTAssertNotNil(MockResultViewController(bookList: [Book]()))
    }

    func testTableViewReload() {
        let controller = MockResultViewController(bookList: [Book]())
        controller.reloadTableView()
        XCTAssertTrue(controller.reloadedTableView)
    }

}
