//
//  LoginViewController.swift
//  First_Part
//
//  Created by PavelM on 28/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  @IBOutlet weak var emailTextFields: UITextField!
  @IBOutlet weak var passwordTextFields: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      title = "Вход"
      addRightButton()
  }
  
  private func addRightButton() {
    
    let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonClicked))
    
    navigationItem.rightBarButtonItem = button
  }
  
  @objc func doneButtonClicked() {
    let email = emailTextFields.text ?? ""
    let password = passwordTextFields.text ?? ""
    
    guard !email.isEmpty && !password.isEmpty else {
      showAlert(with: "Ошибка", and: "Заполните все поля")
      return
    }
    
    AuthManager.shared.signIn(with: email, and: password) { (result) in
      switch result {
      case .success(_):
        StartRouter.shared.routerAfterSuccessAuth(from: self)
        
      case .failure(let error):
        self.showAlert(with: "Ошибка", and: error.localizedDescription)
      }
      
    }
  
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.setNavigationBarHidden(false, animated: true)
  }



}
