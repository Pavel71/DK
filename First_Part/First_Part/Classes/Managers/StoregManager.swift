//
//  StoregManager.swift
//  First_Part
//
//  Created by PavelM on 27/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
import FirebaseStorage

class StoregeManager {
  
  static let shared = StoregeManager()
  
  private init() {}
  
  // Создаем ветку в базе данных
  private let sourceRef = Storage.storage().reference()
  
  func uploadPhoto(by model: RegisterModel, closure: @escaping VoidClouser) {
    // сжимаем фотку
    guard let data = model.photo?.jpegData(compressionQuality: 0.5) else {
      return
    }
    
    sourceRef.child(Keys.avatar.rawValue).child(model.userID).putData(data, metadata: nil) { (metdata, error) in
      // Должны здесь вызвать метод регистрации чтобы было связывание фотки с id

      closure()
    }
    
  }
  
  // получить ссылку на картинку в базе данных
  func loadUrl(for model: RegisterModel, clouser: @escaping OptionalItemClouser<URL>) {
    
    sourceRef.child(Keys.avatar.rawValue).child(model.userID).downloadURL { (url, error) in
   
      clouser(url)
    }
  }
  
}

extension StoregeManager {
  
  private enum Keys: String {
    case avatar 
  }
}
