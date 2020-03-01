//
//  SearchViewModelProtocol.swift
//  BookSearch
//
//  Created by Pericles Junor on 29/02/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

protocol SearchViewModelProtocol {
    func updateTableView()
    func searchBook(with term: String)
}
