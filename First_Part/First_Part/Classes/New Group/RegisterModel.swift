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
    print(email)
    print(password)
    print(birthday)
    
    guard (email != nil), (password != nil), birthday != nil else {
      
      return false
    }
    
//    guard (email ?? "").isEmpty, (password ?? "").isEmpty, birthday != nil else {
//
//      return false
//    }
    return true
  }
  
  // Подготовим данные к отправке в базу данных
  
  var dict: [String: Any] {
    return [
      "email": email ?? "",
      "password": password ?? "",
      "sex": sex?.rawValue ,
      "birthday": (birthday ?? Date()).timeIntervalSince1970
    ]
  }
}
