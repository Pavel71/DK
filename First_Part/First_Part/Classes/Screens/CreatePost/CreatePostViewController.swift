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
  
  private let model = CreatePostModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textView.place
    textView.becomeFirstResponder()
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
    Postmanager.shared.createPostModel(from: user, with: model) { (result) in
      switch result {
      case .failure(let error):
        self.showAlert(with: "Ошибка", and: error.localizedDescription)
      case .success(let succses):
        self.clearView()
        self.showAlert(with: "Успех", and: succses)
      }
    }
  }
  
  func clearView() {
    textView.text = ""
    textView.resignFirstResponder()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    textView.resignFirstResponder()
  }
  
  override func becomeFirstResponder() -> Bool {
    return true
  }
  
  
}

extension CreatePostViewController: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    if let text = textView.text {
      model.setText(text: text)
    }
    
  }
}
