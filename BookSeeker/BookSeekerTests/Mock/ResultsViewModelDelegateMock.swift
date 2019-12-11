//
//  ResultsViewModelDelegateMock.swift
//  BookSeekerTests
//
//  Created by André Alves on 11/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import Foundation

@testable import BookSeeker

class ResultsViewModelDelegateMock: ResultsViewModelDelegate {
    var numberOfCallsGoToDetails: Int = 0
    var numberOfCallsShowError: Int = 0
    func goToDetails(with book: Book) {
        numberOfCallsGoToDetails += 1
    }
    func showError(title: String, message: String) {
        numberOfCallsShowError += 1
    }
}
