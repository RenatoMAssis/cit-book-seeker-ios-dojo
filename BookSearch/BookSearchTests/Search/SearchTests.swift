//
//  SearchTests.swift
//  BookSearchTests
//
//  Created by Pericles Junor on 03/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import XCTest
@testable import BookSearch

class SearchTests: XCTestCase {

    let emptyTermList = [String]()
    var searchViewModel: SearchViewModelProtocol?
    let validSearchTerm: String = "it is a book name"
    let invalidSearchTerm: String = "it is not a book name"
    let mockDataSource: APIRequestsProtocol = MockDataSource()
    let mockSearchViewController = MockSearchViewController()

    func testSuccessRequest() {
        mockDataSource.searchBook(term: validSearchTerm) { (data, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
        }
    }

    func testFailureRequest() {
        mockDataSource.searchBook(term: invalidSearchTerm) { (data, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(data)
        }
    }

    func testSuccessfulViewModelInit() {
        searchViewModel = SearchViewModel(view: mockSearchViewController, dataSource: mockDataSource)
        XCTAssertNotNil(searchViewModel)
    }

    func testSearchHistoryCount() {
        searchViewModel = SearchViewModel(view: mockSearchViewController, dataSource: mockDataSource)
        let count = searchViewModel!.searchTermsCount()
        XCTAssertEqual(count, 0)
    }

    func testSearchViewController() {
        mockSearchViewController.reloadTableView()
        mockSearchViewController.pushSearchResult(controller: ResultViewController(bookList: [Book]()))
        mockSearchViewController.showAlert(title: "title", message: "body")

        XCTAssertTrue(mockSearchViewController.presentedAlert)
        XCTAssertTrue(mockSearchViewController.pushedController)
        XCTAssertTrue(mockSearchViewController.reloadedTableView)
    }
}
