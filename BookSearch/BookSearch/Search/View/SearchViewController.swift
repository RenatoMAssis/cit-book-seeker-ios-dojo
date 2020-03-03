//
//  SearchViewController.swift
//  BookSearch
//
//  Created by Pericles Junor on 29/02/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

protocol SearchViewControllerProtocol {
    func reloadTableView()
    func pushSearchResult(controller: ResultViewController)
    func showAlert(title: String, message: String)
}

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
        reloadTableView()
    }

    private func setupController() {
        self.title = "Search"
        view.setNeedsUpdateConstraints()
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        customView.tableView.register(TermTableViewCell.self, forCellReuseIdentifier: "TermTableViewCell")
        customView.searchController.searchBar.delegate = self
        customView.searchController.definesPresentationContext = true
        self.navigationItem.searchController = customView.searchController
        viewModel.updateTableView()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.searchTermsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: "TermTableViewCell",
                                                        for: indexPath) as? TermTableViewCell) else {
                                                            return UITableViewCell() }
        cell.setup(with: self.viewModel.searchTermBy(index: indexPath.row))
        return cell
    }
}

extension SearchViewController: SearchViewControllerProtocol {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    func pushSearchResult(controller: ResultViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }

    func reloadTableView() {
        self.customView.tableView.reloadData()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else { return }
        self.viewModel.searchBook(with: text)
    }
}
