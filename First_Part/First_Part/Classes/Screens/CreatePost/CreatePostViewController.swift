//
//  CreatePostViewController.swift
//  First_Part
//
//  Created by PavelM on 29/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {
  
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var doneButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  @IBAction func doneButtonPressed(_ sender: UIButton) {
    
    guard let text = textView.text, !text.isEmpty else {
      showAlert(with: "Ошибка", and: "Заполните поле")
      return
    }
    
    guard let user = AuthManager.shared.currentUser else {
      showAlert(with: "Ошибка", and: "Пользователь не найден")
      return
    }
    Postmanager.shared.createPost(from: user, with: text) { (result) in
      switch result {
      case .failure(let error):
        self.showAlert(with: "Ошибка", and: error.localizedDescription)
      case .success(let succses):
        self.showAlert(with: "Успех", and: succses)
      }
    }
  }
  
  
}
