//
//  ViewController.swift
//  MVVM
//
//  Created by Marcos Kilmer Pereira de Aquino on 09/11/21.
//

import UIKit

class ViewController: UIViewController {

    private var postViewModel: PostViewModel?
    private var postDataSource: PostTableViewDataSource<PostTableViewCell, Post>?
    private var postDelegate: PostTableViewDelegate?
    
    private lazy var postTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        updateUI()
    }
    
    private func setupViews() {
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.cellIdentifier)
        self.view.addSubview(postTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            postTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            postTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            postTableView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            postTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            postTableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    private func updateUI() {
        postViewModel = PostViewModel()
        postDelegate = PostTableViewDelegate()
        postViewModel?.bindPostViewModelToController = { [weak self] in
            self?.updateDataSource()
        }
    }
    
    private func updateDataSource() {
        guard let posts = postViewModel?.getPosts() else { return }
        postDataSource = PostTableViewDataSource(cellIdentifier: PostTableViewCell.cellIdentifier, items: posts, configureCell: { (cell, post) in
            cell.configureCell(post: post)
        })
        
        DispatchQueue.main.async {
            self.postTableView.delegate = self.postDelegate
            self.postTableView.dataSource = self.postDataSource
            self.postTableView.reloadData()
        }
    }
}
