//
//  DetailView.swift
//  BookSearch
//
//  Created by Pericles Junor on 02/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class DetailView: UIView, BaseViewProtocol {

    public lazy var lbTitle: UILabel! = { return setupLabel(fontSize: 15) }()
    public lazy var lbAuthor: UILabel! = { return setupLabel(fontSize: 15) }()
    public lazy var lbKind: UILabel! = { return setupLabel(fontSize: 15) }()
    public lazy var lbDescription: UILabel! = { return setupLabel(fontSize: 12) }()

    private lazy var containerView: UIView! = {
        let view = UIView()
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

    public lazy var ivPicture: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }

    func setupLabel(fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func setupSubviews() {
        self.addSubview(scrollView)
        scrollView.addSubview(containerView)
//        scrollView.addSubview(lbKind)
        containerView.addSubview(lbTitle)
//        scrollView.addSubview(lbAuthor)
        containerView.addSubview(ivPicture)
//        scrollView.addSubview(lbDescription)
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

            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25),
            containerView.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            ivPicture.topAnchor.constraint(equalTo: containerView.topAnchor),
            ivPicture.widthAnchor.constraint(equalToConstant: Constant.bookImgWidth),
            ivPicture.heightAnchor.constraint(equalToConstant: Constant.bookImgHeight),
            ivPicture.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            lbTitle.topAnchor.constraint(equalTo: ivPicture.bottomAnchor, constant: 8),
            lbTitle.leadingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 8),
            lbTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            lbTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            lbTitle.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)

//            lbAuthor.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 8),
//            lbAuthor.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 8),
//            lbAuthor.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),
//            lbAuthor.heightAnchor.constraint(equalToConstant: 17),
//            lbAuthor.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
//
//            lbKind.topAnchor.constraint(equalTo: lbAuthor.bottomAnchor, constant: 8),
//            lbKind.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 8),
//            lbKind.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),
//            lbKind.heightAnchor.constraint(equalToConstant: 17),
//            lbKind.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
//
//            lbDescription.topAnchor.constraint(equalTo: lbKind.bottomAnchor, constant: 15),
//            lbDescription.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 8),
//            lbDescription.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),
//            lbDescription.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            lbDescription.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        customSetup()
    }

    func customSetup() {
        self.backgroundColor = .white
        lbTitle.backgroundColor = .magenta
        containerView.backgroundColor = .blue
//        lbDescription.textAlignment = .left
    }

}
