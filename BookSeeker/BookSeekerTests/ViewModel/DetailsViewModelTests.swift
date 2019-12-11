//
//  DetailsViewModelTests.swift
//  BookSeekerTests
//
//  Created by André Alves on 11/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import XCTest
@testable import BookSeeker
class DetailsViewModelTests: XCTestCase {
    var sut: DetailsViewModel?
    var sutWithoutValidURL: DetailsViewModel?
    let view: DetailsViewControllerMock = DetailsViewControllerMock()
    var book = Book(artworkUrl60: "",
                    artworkUrl100: "https://google.com.br",
                    trackName: "",
                    releaseDate: "",
                    genres: [],
                    artistName: "",
                    description: "",
                    price: nil,
                    currency: "",
                    averageUserRating: nil)

    override func setUp() {
        sut = DetailsViewModel(view: view, book: book)
        book.artworkUrl100 = ""
        sutWithoutValidURL = DetailsViewModel(view: view, book: book)
    }

    override func tearDown() {
        sut = nil
        sutWithoutValidURL = nil
    }

    func testDidLoadValidURL() {
        sut?.didLoad()
        XCTAssertEqual(view.numberOfCallsConfigureView, 1)
    }
    func testDidLoadInvalidURL() {
       sutWithoutValidURL?.didLoad()
       XCTAssertEqual(view.numberOfCallsConfigureView, 0)
    }

}
