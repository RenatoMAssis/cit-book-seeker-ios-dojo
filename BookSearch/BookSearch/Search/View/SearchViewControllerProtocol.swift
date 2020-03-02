//
//  SearchViewControllerProtocol.swift
//  BookSearch
//
//  Created by Pericles Junor on 01/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

protocol SearchViewControllerProtocol {
    func reloadSearchHistoryList(data: [String]?)
    func pushSearchResult(controller: ResultViewController)
    func showAlert(title: String, message: String)
}
