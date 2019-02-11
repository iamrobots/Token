//
//  ViewController.swift
//  Token
//
//  Created by David Lively on 2/8/19.
//  Copyright © 2019 David Lively. All rights reserved.
//

import UIKit

class IDViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel = IDViewModel(identity: Identity.moc)

    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()
    
    var photoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.isHidden = true
        return button
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    var birthDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    var uuidLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .center
        return label
    }()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.spacing = 16
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstriants()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        photoButton.layer.cornerRadius = 0.25 * view.bounds.width
        photoButton.layer.masksToBounds = true
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        nameLabel.text = viewModel.name
        birthDateLabel.text = viewModel.birthDate
        uuidLabel.text = viewModel.uuid
        
        if let photo = viewModel.photo {
            photoImageView.image = photo
            photoImageView.isHidden = false
        } else {
            photoButton.isHidden = false
        }
        
        verticalStackView.addArrangedSubview(photoImageView)
        verticalStackView.addArrangedSubview(photoButton)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(birthDateLabel)
        verticalStackView.addArrangedSubview(uuidLabel)
        scrollView.addSubview(verticalStackView)
        view.addSubview(scrollView)
    }

    private func setupConstriants() {
        let guide = view.safeAreaLayoutGuide
        
        scrollView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true

        verticalStackView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        photoImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        photoButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        photoButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
    }
}

