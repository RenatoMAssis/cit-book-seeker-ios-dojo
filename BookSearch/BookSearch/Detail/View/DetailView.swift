//
//  DetailView.swift
//  BookSearch
//
//  Created by Pericles Junor on 02/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class DetailView: UIView, BaseViewProtocol {

    public lazy var infoView: BookInfoView! = {
        let view = BookInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public let scrollView: UIScrollView! = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
        self.addSubview(scrollView)
        scrollView.addSubview(infoView)
        setupConstraints()
    }

    func setupConstraints() {
        if #available(iOS 11, *) {
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            infoView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25),
            infoView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            infoView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        customSetup()
    }

    func customSetup() {
        self.backgroundColor = .white
    }

}
