//
//  FeedViewController.swift
//  First_Part
//
//  Created by PavelM on 29/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  private var posts: [Post] = [] {
    
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    delegating()
    registerCells()
    
    Postmanager.shared.loadingAllPosts { result in
      switch result {
      case.failure(let error): self.title = error.localizedDescription
      case.success(let posts):
        self.posts = posts
        self.title = "Новости"
      }
    }
  }
  
  // MARK: Delegating and Registers
  private func delegating() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  private func registerCells() {
    tableView.register(PostTableViewCell.nib, forCellReuseIdentifier: PostTableViewCell.name)
  }
  
}

// MARK: TABLEVIEW DELEGATE and DATASOURCE
extension FeedViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
}

extension FeedViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.name, for: indexPath) as! PostTableViewCell
    cell.textView.text = posts[indexPath.row].text
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
}
