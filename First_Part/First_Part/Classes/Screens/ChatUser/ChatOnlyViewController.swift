//
//  ChatOnlyViewController.swift
//  First_Part
//
//  Created by PavelM on 03/04/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ChatOnlyViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    delegate()
  }
  
  func delegate() {
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  
  
}

// MARK: TableView DELGATE
extension ChatOnlyViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
  
}

// MARK: TableView DATASOURCE
extension ChatOnlyViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    <#code#>
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    <#code#>
  }
  
  
}
