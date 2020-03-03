//
//  TermTableViewCell.swift
//  BookSearch
//
//  Created by Pericles Junor on 03/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

protocol TermTableViewCellProtocol {
    func setupCell(with term: String)
}
class TermTableViewCell: UITableViewCell, BaseViewProtocol {

    public let lbTerm: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()

    private var viewModel: TermCellViewModelProtocol!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }

    func setup(with term: String) {
        viewModel = TermCellViewModel(view: self, term: term)
    }

    func setupSubviews() {
        self.addSubview(lbTerm)
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
           lbTerm.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           lbTerm.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
           lbTerm.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 25)
       ])
        customSetup()
    }

    func customSetup() {
        self.backgroundColor = .none
    }
}

extension TermTableViewCell: TermTableViewCellProtocol {
    func setupCell(with term: String) {
        self.lbTerm.text = term
    }
}
