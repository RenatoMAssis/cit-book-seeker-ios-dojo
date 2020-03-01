//
//  SearchViewController.swift
//  BookSearch
//
//  Created by Pericles Junor on 29/02/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    private let customView = SearchView()
    private var viewModel: SearchViewModelProtocol!

    init() {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = SearchViewModel(view: self, dataSource: APIRequests())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupController() {
        self.title = "Search"
        view.setNeedsUpdateConstraints()
        customView.tableView.delegate = self
        customView.searchController.searchBar.delegate = self
        customView.searchController.searchResultsUpdater = self
        customView.searchController.definesPresentationContext = true

        self.navigationItem.searchController = customView.searchController
        viewModel.updateTableView()
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO - Implement method
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        //TODO: - return list count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
        //TODO: - return custom UITableViewCell
    }
}

extension SearchViewController: SearchViewControllerProtocol {
    func pushSearchResult(with books: [Book]) {
        self.navigationController?.pushViewController(ResultViewController(), animated: true)
    }

    func reloadSearchHistoryList(_ data: [String]?) {
        // TODO: - Implement reload list
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else { return }
        self.viewModel.searchBook(with: text)
    }
}
