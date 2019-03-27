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
  
  private var userRef: DatabaseReference {
    
    return sourceRef.child("users")
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

    
    // Мой ID
    let id = model.userID
    print("ID - \(id)")
    print("Создаю User")
    auth.createUser(withEmail: email, password: password) { (result, error) in
      var dict = model.dict
      dict["id"] = id
      self.userRef.child(id).setValue(dict, withCompletionBlock: { (error, reference) in
        self.addAvatarUrlIFNedeed(for: model)
      })
      
    }
    completition()
  }
  
  func addAvatarUrlIFNedeed(for model: RegisterModel) {
    
    StoregeManager.shared.loadUrl(for: model) { (url) in
      guard let url = url else {
        return
      }
      self.userRef.child(model.userID).child("avatarUrl").setValue(url.absoluteString)
      
      
    }
  }
  
  
}
