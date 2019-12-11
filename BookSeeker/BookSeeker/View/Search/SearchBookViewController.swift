//
//  SearchBookViewController.swift
//  BookSeeker
//
//  Created by André Alves on 09/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit

class SearchBookViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblVwContent: UITableView!
    var delegate: SearchBookViewControllerDelegate!
    private let preferences = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchBar()
    }
    private func configureTableView() {
        tblVwContent.dataSource = self
        tblVwContent.delegate = self
        tblVwContent.register(LastSearchesTableViewCell.nib,
                              forCellReuseIdentifier: LastSearchesTableViewCell.identifier)
    }
    private func configureSearchBar() {
        searchBar.placeholder = "Apple Books"
        searchBar.delegate = self
    }
}

// MARK: - TableViewDataSource

extension SearchBookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let lastSearches = preferences.stringArray(forKey: "lastSearches") else {
            return 0
        }
        return lastSearches.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let lastSearches = preferences.stringArray(forKey: "lastSearches"),
            let cell = tableView.dequeueReusableCell(withIdentifier:
                LastSearchesTableViewCell.identifier,
                                                     for: indexPath) as? LastSearchesTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: lastSearches[indexPath.row])
        return cell
    }
}

// MARK: - TableViewDelegate

extension SearchBookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let lastSearches = preferences.stringArray(forKey: "lastSearches") else { return }
        delegate?.doSearch(with: lastSearches[indexPath.row])
    }
}

// MARK: - UISearchBarDelegate

extension SearchBookViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let currentText = searchBar.text else { return }
        var lastSearches = preferences.stringArray(forKey: "lastSearches") ?? []
        lastSearches.append(currentText)
        preferences.set(lastSearches, forKey: "lastSearches")
        tblVwContent.reloadData()
        delegate?.doSearch(with: currentText)
    }
}
