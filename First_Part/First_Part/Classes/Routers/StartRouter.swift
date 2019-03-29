//
//  StartRouter.swift
//  First_Part
//
//  Created by PavelM on 28/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit


final class StartRouter {
  
  static let shared = StartRouter()
  private init() {}
  
  func goToRegisterScreen(from source: UIViewController) {
    let vc = RegisterViewController()
    source.navigationController?.pushViewController(vc, animated: true)
    
  }
  
  func goToLoginScreen(from source: UIViewController) {
    let vc = LoginViewController()
    source.navigationController?.pushViewController(vc, animated: true)
  }
}
