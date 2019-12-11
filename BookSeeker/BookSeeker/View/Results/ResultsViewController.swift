//
//  ResultsViewController.swift
//  BookSeeker
//
//  Created by André Alves on 10/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var tblVwConteudo: UITableView!
    var delegate: ResultsViewControllerDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    private func configureTableView() {
        tblVwConteudo.delegate = self
        tblVwConteudo.dataSource = self
        tblVwConteudo.register(ResultTableViewCell.nib, forCellReuseIdentifier: ResultTableViewCell.identifier)
    }
}

// MARK: - UITableViewDataSource
extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.numberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tuple = delegate.cellForRow(with: indexPath.row)
        guard let cell = tblVwConteudo.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier,
                                                           for: indexPath) as? ResultTableViewCell, let url = URL(string: tuple.imageURL) else {
            return UITableViewCell()
        }
        cell.configureCell(with: url, and: tuple.title, and: self)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.goToDetails(with: indexPath.row)
    }
}

// MARK: - ResultTableViewCellDelegate
extension ResultsViewController: ResultTableViewCellDelegate {
    func getArtwork(with imageURL: URL, completion: @escaping ImageCompletionBlock) {
        delegate.getArtwork(with: imageURL, completion: completion)
    }
}
