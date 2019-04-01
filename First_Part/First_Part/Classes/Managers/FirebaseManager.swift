//
//  FirebaseManager.swift
//  First_Part
//
//  Created by PavelM on 29/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager {
  
  // Корневая ветка в базе данных
  var sourceRef: DatabaseReference {
    return Database.database().reference()
  }
  // Ветка Users
  var userRef: DatabaseReference {
    return sourceRef.child("users")
  }
  // Константа для создания и аутентификации пользователя
  let auth = Auth.auth()
  
}
