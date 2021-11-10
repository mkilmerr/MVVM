//
//  PostTableViewCell.swift
//  MVVM
//
//  Created by Marcos Kilmer Pereira de Aquino on 09/11/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    static public var cellIdentifier: String = "PostTableViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var postStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        bodyLabel.text = ""
    }
    
    public func configureCell(post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
    
    private func setupViews() {
        contentView.addSubview(postStackView)
        postStackView.addArrangedSubview(titleLabel)
        postStackView.addArrangedSubview(bodyLabel)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            postStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            postStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
