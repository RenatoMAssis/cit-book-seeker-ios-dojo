//
//  DetailsViewControllerMock.swift
//  BookSeekerTests
//
//  Created by André Alves on 11/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import Foundation

@testable import BookSeeker

class DetailsViewControllerMock: DetailsViewController {
    var numberOfCallsConfigureView: Int = 0
    override func configureView(with imageURL: URL,
                                and title: String,
                                and description: String,
                                and userRating: Double,
                                and author: String) {
        numberOfCallsConfigureView += 1
    }
}
