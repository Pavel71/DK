//
//  RegisterModel.swift
//  First_Part
//
//  Created by PavelM on 07/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class RegisterModel {
  
  var photo: UIImage?
  var email: String?
  var password: String?
  var sex: Sex?
  var birthday: Date?
  
  var isFilled: Bool {
    guard (email ?? "").isEmpty, (password ?? "").isEmpty, birthday != nil else {
      
      return false
    }
    return true
  }
}
