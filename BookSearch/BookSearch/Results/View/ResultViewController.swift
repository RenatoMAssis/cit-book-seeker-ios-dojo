//
//  ResultViewController.swift
//  BookSearch
//
//  Created by Pericles Junor on 29/02/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    private let customView = ResultView()
    private var viewModel: ResultViewModelProtocol!

    init(bookList: [Book]) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = ResultViewModel(view: self, searchResult: bookList)
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
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

    func setupController() {
        self.title = "In Your Library"
        view.setNeedsUpdateConstraints()
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        customView.tableView.register(BookTableViewCell.self, forCellReuseIdentifier: "BookTableViewCell")
    }
}

extension ResultViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.resultCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? BookTableViewCell) else { return UITableViewCell() }
        cell.setup(with: self.viewModel.getBookBy(index: indexPath.row))
        return cell
    }
}

extension ResultViewController: ResultViewControllerProtocol {

}
