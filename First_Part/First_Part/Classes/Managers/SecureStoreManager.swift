//
//  SecureStoreManager.swift
//  First_Part
//
//  Created by PavelM on 29/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//



import Foundation
import Locksmith

final class SecureStorageManager {
  static let shared = SecureStorageManager()
  
  let myUserAccountIdentifier = "MyUserAccountIdentifier"
  
  private init() {}
  
  func save(email: String?, password: String?, completionHandler: @escaping ResultClouser) {
    guard let email = email, let password = password else {
      completionHandler(.failure(fatalError("Передайте все данные пожалуйста")))
      return
    }
    let data = [Keys.email.rawValue: email,
                Keys.password.rawValue: password]
    do {
      try Locksmith.saveData(data: data, forUserAccount: myUserAccountIdentifier)
      completionHandler(.success("Данные сохранены"))
    }
    catch {
      completionHandler(.failure(fatalError("Данные не удалось сохранить")))
    }

  }
  
  func eraseUserDataIfNeeded() {
    guard isLoggedIn() else {
      return
    }
    try? Locksmith.deleteDataForUserAccount(userAccount: myUserAccountIdentifier)
  }
  
  func loadEmailAndPassword() -> (email: String?, password: String?) {
    
    let dictionary = Locksmith.loadDataForUserAccount(userAccount: myUserAccountIdentifier)
    let email = dictionary?[Keys.email.rawValue] as? String ?? nil
    let password = dictionary?[Keys.password.rawValue] as? String ?? nil
    return (email: email, password: password)
  }
  
  func isLoggedIn() -> Bool {
    let credentials = loadEmailAndPassword()
    return credentials.email != nil && credentials.password != nil
  }
}

private extension SecureStorageManager {
  enum Keys: String {
    case email
    case password
  }
}
