//
//  ResultView.swift
//  BookSearch
//
//  Created by Pericles Junor on 29/02/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class ResultView: UIView, BaseViewProtocol {
    
    public lazy var tableView: UITableView! = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .purple
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        setupConstraints()
    }

    func setupConstraints() {

        if #available(iOS 11, *) {
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }

        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        customSetup()
    }

    func customSetup() {
        self.backgroundColor = .white
    }

}
