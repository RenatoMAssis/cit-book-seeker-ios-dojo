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

    init() {
        super.init(nibName: nil, bundle: nil)
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

    func setupController() {
        self.title = "In Your Library"
        customView.tableView.delegate = self
    }
}

extension ResultViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        //TODO: - Return list count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
        //TODO: - Return custom tableviewcell
    }
}

extension ResultViewController: ResultViewControllerProtocol {

}
