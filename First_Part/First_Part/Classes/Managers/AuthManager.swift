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

class AuthManager: FirebaseManager {
  
  static let shared = AuthManager()
  var currentUser: User?
  private override init() {}
  
  func signInIfNeeded() {
    let credentials = SecureStorageManager.shared.loadEmailAndPassword()
    
    guard let email = credentials.email, let password = credentials.password else {
      return
    }
    
    signIn(with: email, and: password) { (result) in
      switch result {
      case .success(let sucsess):
        print(sucsess)
      case .failure(let error):
        print(error)
      }
    }
  }

  // Метод Авторизации!
  func signIn(with email: String, and password: String, completionHandler: @escaping (Result<String, Error>) -> Void) {
    
    print(email,password)
    
    auth.signIn(withEmail: email, password: password) { (result, error) in

      if let error = error {
        print(error)
        completionHandler(.failure(error))
        
      } else {
        
        guard let user = result?.user else {
          completionHandler(.failure(error!))
          return
        }
        self.currentUser = user
        completionHandler(.success("Авторизация прошла успешно!"))
        
      }
    }
  }
  
  
  // Метод регистрации
  func register(with model: RegisterModel, completition: @escaping ResultClouser) {
    
    guard model.isFilled else {
      return
    }
    guard let email = model.email, let password = model.password else {
      return
    }
    // Мой ID
    let id = model.userID
    
    // Проходим регистрацию и кладем данные пользователя в БД!
    auth.createUser(withEmail: email, password: password) { (result, error) in
      
      if let error = error {
        
        completition(.failure(error))
        
      } else {
        
        guard let res = result else {
          return
        }
        self.currentUser = res.user
        // Успешно создали юзера
        var dict = model.dict
        dict["id"] = id
        
        self.userRef.child(res.user.uid).setValue(dict, withCompletionBlock: { (error, reference) in
          self.addAvatarUrlIFNedeed(for: model, user: res.user)
          
        })
        completition(.success("Регистрация прошла успешно"))
      }
    }
  }
  
  
  
  func addAvatarUrlIFNedeed(for model: RegisterModel, user: User) {
    
    StoregeManager.shared.loadUrl(for: model) { (url) in
      guard let url = url else {
        return
      }
      self.userRef.child(user.uid).child("avatarUrl").setValue(url.absoluteString)
      
      
    }
  }
  
  
}
