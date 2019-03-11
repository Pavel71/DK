//
//  AuthManager.swift
//  First_Part
//
//  Created by PavelM on 11/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class AuthManager {
  
  static let shared = AuthManager()
  private init() {}
  
  // Корневая ветка в базе данных
  private var sourceRef: DatabaseReference {
    
    return Database.database().reference()
    
  }
  
  private let auth = Auth.auth()
  
  
  // Метод регистрации
  func register(with model: RegisterModel, completition: VoidClouser) {
    
    guard model.isFilled else {
      return
    }
    
    guard let email = model.email, let password = model.password else {
      return
    }
    
    let usersRef = sourceRef.child("users")
    
    // Можно использовать id
//    let id = UUID.init().uuidString
    
    // Мой ID
    let id = ID()
    print("ID - \(id)")
    print("Создаю User")
    auth.createUser(withEmail: email, password: password) { (result, error) in
      var dict = model.dict
      dict["id"] = id
      usersRef.child(id).setValue(dict)
      
    }
    completition()
  }
}
