//
//  SearchCoordinator.swift
//  BookSeeker
//
//  Created by André Alves on 10/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit

class SearchCoordinator {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)
        guard let view = mainStoryboard.instantiateViewController(identifier: "SearchBookViewController") as?
            SearchBookViewController else {
            return
        }
        let viewModel = SearchBookViewModel(view: view, delegate: self)
        navigationController.pushViewController(viewModel.view, animated: true)
    }
    private func goToResultsFlow(with books: [Book]) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)
        guard let view = mainStoryboard.instantiateViewController(identifier: "ResultsViewController") as?
            ResultsViewController else {
            return
        }
        let viewModel = ResultsViewModel(view: view, books: books, delegate: self)
        navigationController.pushViewController(viewModel.view, animated: true)
    }
    private func goToDetailsFlow(with book: Book) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)
        guard let view = mainStoryboard.instantiateViewController(identifier: "DetailsViewController") as?
            DetailsViewController else {
            return
        }
        let viewModel = DetailsViewModel(view: view, book: book)
        navigationController.pushViewController(viewModel.view, animated: true)
    }
}

// MARK: - ViewModelDelegate

extension SearchCoordinator: ViewModelDelegate {
    func showError(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        navigationController.show(alertController, sender: nil)
    }
}

// MARK: - SearchBookViewModelDelegate

extension SearchCoordinator: SearchBookViewModelDelegate {
    func goToResults(with books: [Book]) {
        goToResultsFlow(with: books)
    }
}

// MARK: - ResultsViewModelDelegate

extension SearchCoordinator: ResultsViewModelDelegate {
    func goToDetails(with book: Book) {
        goToDetailsFlow(with: book)
    }
}
