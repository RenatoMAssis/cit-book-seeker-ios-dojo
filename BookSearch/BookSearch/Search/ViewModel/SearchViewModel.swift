//
//  SearchViewModel.swift
//  BookSearch
//
//  Created by Pericles Junor on 29/02/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit
import CoreData

protocol SearchViewModelProtocol {
    func updateTableView()
    func searchTermsCount() -> Int
    func searchBook(with term: String)
    func searchTermBy(index: Int) -> String
}

class SearchViewModel: SearchViewModelProtocol {

    private let view: SearchViewControllerProtocol!
    private let dataSource: APIRequestsProtocol!

    private var searchHistory: [NSManagedObject] = []

    init(view: SearchViewControllerProtocol, dataSource: APIRequestsProtocol) {
        self.view = view
        self.dataSource = dataSource
    }

    func updateTableView() {
        if let terms = CoreDataManager.fetchData(), terms.count > 0 {
            searchHistory = terms
            self.view.reloadTableView()
        }
    }

    func searchTermBy(index: Int) -> String {
        return searchHistory[index].value(forKey: "text") as? String ?? ""
    }

    func searchTermsCount() -> Int {
        return searchHistory.count
    }

    func searchBook(with term: String) {

        CoreDataManager.save(term: term)

        dataSource.searchBook(term: term) { [weak self] (data, _) in
            guard let strongSelf = self, let jsonData = data else { return }

            var bookList = [Book]()
            for item in jsonData {
                guard let title = item["trackName"] as? String,
                    let picture = item["artworkUrl100"] as? String,
                    let description = item["description"] as? String,
                    let author = item["artistName"] as? String,
                let kind = item["kind"] as? String else { return }

                bookList.append(Book(title: title,
                                     artwork: picture,
                                     description: description,
                                     author: author,
                                     kind: kind))

            }

            if bookList.count > 0 {
                DispatchQueue.main.async {
                    strongSelf.view.pushSearchResult(controller: ResultViewController(bookList: bookList))
                }
            } else {
                strongSelf.view.showAlert(title: "Warning", message: "Your search did not match any book.")
            }
        }
    }
}
