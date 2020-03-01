//
//  SearchView.swift
//  BookSearch
//
//  Created by Pericles Junor on 29/02/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class SearchView: UIView, BaseViewProtocol {
    
    public lazy var tableView: UITableView! = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var lbHistory: UILabel! = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "History"
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public let searchController: UISearchController! = {
        let search = UISearchController(searchResultsController: nil)
        return search
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }

    func setupSubviews() {
        self.addSubview(tableView)
        self.addSubview(lbHistory)
        setupConstraints()
    }

    func setupConstraints() {

        if #available(iOS 11, *) {
            lbHistory.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            lbHistory.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }

        NSLayoutConstraint.activate([
            lbHistory.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lbHistory.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lbHistory.heightAnchor.constraint(equalToConstant: 18),

            tableView.topAnchor.constraint(equalTo: lbHistory.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        customSetup()
    }

    func customSetup() {
        self.backgroundColor = .white
    }
}
