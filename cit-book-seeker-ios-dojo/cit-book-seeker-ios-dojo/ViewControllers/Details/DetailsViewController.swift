//
//  SearchViewController.swift
//  cit-book-seeker-ios-dojo
//
//  Created by Zied on 11/12/19.
//  Copyright © 2019 ioasys. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UIScrollViewDelegate {

    //MARK: - Properties
    public var book: BookModel? {
        didSet{
            guard let descriptionOfBook = book?.description else {return}
            descriptionBook.attributedText = descriptionOfBook.htmlToAttributedString
        }
    }
    
    //MARK: - Outlets
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    public lazy var containerView: UIView = {
        let containerView = UIView(frame: .zero)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        return containerView
    }()
    
    private lazy var stackView: UIStackView = {
        let  stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = UIStackView.Distribution.fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var titleLabelDescription:UILabel = {
        let titleLabelDescription = UILabel(frame: .zero)
        titleLabelDescription.translatesAutoresizingMaskIntoConstraints = false
        titleLabelDescription.textAlignment = .left
        titleLabelDescription.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabelDescription.textColor = .black
        titleLabelDescription.text = "Publisher description"
        titleLabelDescription.numberOfLines = 0
        
        return titleLabelDescription
    }()
    
    private lazy var descriptionBook:UILabel = {
        let descriptionBook = UILabel(frame: .zero)
        descriptionBook.translatesAutoresizingMaskIntoConstraints = false
        descriptionBook.textAlignment = .left
        descriptionBook.font = UIFont(name: "FontAwesome", size: 16)
        descriptionBook.textColor = .black
        descriptionBook.numberOfLines = 0
        return descriptionBook
    }()
    
    private lazy var descriptionView: UIView = {
        let descriptionView = UIView(frame: .zero)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.backgroundColor = .white
        return descriptionView
    }()
    
    //MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        constraintUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        }
    }
    
    //MARK: - Cosntraints Layout
    
    private func constraintUI() {
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(descriptionView)
        descriptionView.addSubview(titleLabelDescription)
        descriptionView.addSubview(descriptionBook)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            
            titleLabelDescription.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 40),
            titleLabelDescription.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 20),
            titleLabelDescription.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -20),
            
            descriptionBook.topAnchor.constraint(equalTo: titleLabelDescription.bottomAnchor, constant: 16),
            descriptionBook.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 20),
            descriptionBook.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -20),
            descriptionBook.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -40)
                        
        ])
    }
    
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
