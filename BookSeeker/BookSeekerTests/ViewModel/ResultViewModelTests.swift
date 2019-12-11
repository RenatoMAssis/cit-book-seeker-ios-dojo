//
//  ResultViewModelTests.swift
//  BookSeekerTests
//
//  Created by André Alves on 11/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import XCTest

@testable import BookSeeker

class ResultViewModelTests: XCTestCase {
    var sut: ResultsViewModel?
    let delegate: ResultsViewModelDelegateMock = ResultsViewModelDelegateMock()

    override func setUp() {
        let view = ResultsViewController()
        sut = ResultsViewModel(view: view, books: [Book(artworkUrl60: "",
                                                        artworkUrl100: "testeURL",
                                                        trackName: "testeTitulo",
                                                        releaseDate: "",
                                                        genres: [],
                                                        artistName: "",
                                                        description: "",
                                                        price: nil,
                                                        currency: "",
                                                        averageUserRating: nil)],
                               delegate: delegate)
    }

    override func tearDown() {
        sut = nil
    }
    func testGoToDetails() {
        sut?.goToDetails(with: 0)
        XCTAssertEqual(delegate.numberOfCallsGoToDetails, 1)
    }
    func testNumberOfRows() {
        let numberOfRows = sut?.numberOfRows() ?? 0
        XCTAssertEqual(numberOfRows, 1)
    }
    func testCellForRow() {
        let tuple = sut?.cellForRow(with: 0)
        XCTAssertEqual(tuple?.title, "testeTitulo")
        XCTAssertEqual(tuple?.imageURL, "testeURL")
    }

}
