//
//  HomeViewController.swift
//  cit-book-seeker-ios-dojo
//
//  Created by Zied on 11/12/19.
//  Copyright © 2019 ioasys. All rights reserved.
//

import UIKit

public class HomeViewController: UIViewController {

    //MARK: - Proprties
    
    public var filteredBoksResult = [BookModel]()
    
    public var booksResult: [BookModel]? {
        didSet {
            DispatchQueue.main.async {
                guard let results = self.booksResult else {return}
                self.filteredBoksResult = results
                self.tableView.reloadData()
            }
        }
    }
    
    public var filteredBooksResult = [BookModel]()
    
    let viewModel: HomeViewModel
        
    //MARK: - Outlets
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = "Apple Books"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var searchView: UIView = {
        let searchView = UIView(frame: .zero)
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.backgroundColor = .clear
        return searchView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(ListBooksViewCell.self, forCellReuseIdentifier: "ListBooksViewCell")
        return tableView
    }()
    
    //MARK: - Initializers
    
    init(viewModel : HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.navigationController?.navigationBar.tintColor = .red
        self.view.backgroundColor = .white
        title = "In Your Library"
        constraintUI()
        viewModel.viewDidLoad()
    }
    
    //MARK: - CobstraintUI
    
    private func constraintUI(){
        
        view.addSubview(searchView)
        searchView.addSubview(searchBar)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 50),
            
            searchBar.leadingAnchor.constraint(equalTo: searchView.leadingAnchor),
            searchBar.topAnchor.constraint(equalTo: searchView.topAnchor),
            searchBar.trailingAnchor.constraint(equalTo: searchView.trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: searchView.bottomAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBoksResult.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListBooksViewCell", for: indexPath) as? ListBooksViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.configure(book: filteredBoksResult[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ///Show Details Using Web View
        let detailsViewController = DetailsViewController()
        detailsViewController.book = booksResult?[indexPath.row]
        
        ///Show Details Using Native Components
        //let detailsViewController = DetailsWebViewController()
        //detailsViewController.book = booksResult?[indexPath.row]
        
        detailsViewController.title = booksResult?[indexPath.row].trackName ?? ""
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

extension HomeViewController: UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            filteredBoksResult.removeAll()
            viewModel.viewDidLoad()
            return
        }
        guard let nonFilteredBooksResult = booksResult else { return }
        filteredBoksResult = nonFilteredBooksResult.filter({ (book) -> Bool in
            let bookTitle = book.trackName ?? ""
            return bookTitle.lowercased().hasPrefix(searchText.lowercased())
        })
        tableView.reloadData()
    }

}

extension HomeViewController: HomeViewModelDelegate {
    public func getBooksResponse(resultResponse: [BookModel]) {
        self.booksResult = resultResponse
    }
}
