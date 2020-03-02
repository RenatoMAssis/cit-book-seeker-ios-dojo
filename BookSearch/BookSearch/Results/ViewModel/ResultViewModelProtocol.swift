//
//  ResultViewModelProtocol.swift
//  BookSearch
//
//  Created by Pericles Junor on 29/02/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

protocol ResultViewModelProtocol {
    func reloadTableView()
    func resultCount() -> Int
    func getBookBy(index: Int) -> Book
}
