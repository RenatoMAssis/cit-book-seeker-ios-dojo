//
//  SearchViewControllerProtocol.swift
//  BookSearch
//
//  Created by Pericles Junor on 01/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

protocol SearchViewControllerProtocol {
    func reloadSearchHistoryList(_ data: [String]?)
    func pushSearchResult(with books: [Book])
}
