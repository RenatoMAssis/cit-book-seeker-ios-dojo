//
//  BookTest.swift
//  BookSearchTests
//
//  Created by Pericles Junor on 03/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import XCTest
@testable import BookSearch

class BookTest: XCTestCase {
    let kind: String = "ebook"
    let title: String = "This is a book Name!"
    let author: String = "George Martin"
    let artworkURL: String = "https://api.chucknorris.io/"
    let bookDescription: String = "Mussum Ipsum, cacilds vidis litro abertis."

    func testBookSuccessfulInit() {
        let newBook = Book(title: title,
                           artwork: artworkURL,
                           description: bookDescription,
                           author: author,
                           kind: kind)

        XCTAssertNotNil(newBook)
    }
}
