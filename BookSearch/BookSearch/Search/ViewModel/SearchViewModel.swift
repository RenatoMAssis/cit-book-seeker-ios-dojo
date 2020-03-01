//
//  SearchViewModel.swift
//  BookSearch
//
//  Created by Pericles Junor on 29/02/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class SearchViewModel: SearchViewModelProtocol {

    private let view: SearchViewControllerProtocol!
    private let dataSource: APIRequestsProtocol!

    private var searchHistory: [String]?

    init(view: SearchViewControllerProtocol, dataSource: APIRequestsProtocol) {
        self.view = view
        self.dataSource = dataSource
    }

    func updateTableView() {
        // TODO: - reload tableview
    }

    func searchBook(with term: String) {
        dataSource.searchBook(term: term) { [weak self] (data, _) in

            guard let strongSelf = self, let jsonData = data else { return }

            var bookList = [Book]()
            for item in jsonData {
                guard let title = item["trackName"] as? String,
                    let picture = item["artworkUrl100"] as? String,
                    let description = item["description"] as? String else { return }
                bookList.append(Book(title: title, artwork: picture, description: description))
            }
            DispatchQueue.main.async {
                strongSelf.view.pushSearchResult(with: bookList)
            }
        }
    }
}
