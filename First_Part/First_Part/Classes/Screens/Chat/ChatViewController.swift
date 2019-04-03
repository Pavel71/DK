//
//  ChatViewController.swift
//  First_Part
//
//  Created by PavelM on 02/04/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private var users: [DKUser] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    delegate()
    
    Usermanager.shared.loadingUsers { (result) in
      switch result {
      case .success(let users):
        self.users = users
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
    
    
  }
  
  private func delegate() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  
}

extension ChatViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
}


extension ChatViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell()
    cell.textLabel?.text = users[indexPath.row].email
    
    return cell
  }
  
  
}
