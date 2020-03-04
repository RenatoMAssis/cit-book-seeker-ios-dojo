//
//  DetailViewController.swift
//  BookSearch
//
//  Created by Pericles Junor on 29/02/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

protocol DetailViewControllerProtocol {
    func setupBookdata(title: String,
                       author: String,
                       kind: String,
                       description: String,
                       artwork: String)
}

class DetailViewController: UIViewController {

    private let customView = DetailView()

    private var viewModel: DetailViewModelProtocol!

    init(book: Book) {
        super.init(nibName: nil, bundle: nil)
        viewModel = DetailViewModel(view: self, book: book)
    }

    override func loadView() {
        view = customView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()

    }

    override func viewDidAppear(_ animated: Bool) {
        customView.scrollView.resizeScrollViewContentSize()
    }

    private func setupController() {
        self.title = viewModel.bookTitle()
        view.needsUpdateConstraints()
        viewModel.setupDataOnView()
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func setupBookdata(title: String, author: String, kind: String, description: String, artwork: String) {
        self.customView.infoView.lbKind.text = kind
        self.customView.infoView.lbTitle.text = title
        self.customView.infoView.lbAuthor.text = author
        self.customView.infoView.lbDescription.text = description + description + description
        self.customView.infoView.ivPicture.sd_setImage(with: URL(string: artwork), completed: nil)
    }
}
