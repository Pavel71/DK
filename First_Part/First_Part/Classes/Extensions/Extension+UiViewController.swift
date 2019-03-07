//
//  Extension+UiViewController.swift
//  First_Part
//
//  Created by PavelM on 07/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func showAlert(with title: String, and message: String) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController,animated: true,completion: nil)
  }
}
