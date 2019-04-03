//
//  Usermanager.swift
//  First_Part
//
//  Created by PavelM on 02/04/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation
import Firebase

final class Usermanager: FirebaseManager {
  
  static let shared = Usermanager()
  
  func loadingUsers(completion: @escaping (Result<[DKUser],Error>) -> Void) {
    
    userRef.observe(.value) { snapshot in
      
      if let dict = (snapshot.value as? [String:[String: Any]]) {
        
        let userData = dict.map { userDict in
          
          return try! DKUser.init(from: userDict.value)
          
        }
        
        completion(.success(userData))
       
        
      } else {
        
        completion(.failure(UserError.getUsersError))
      }
      
      
    }
  }
}

extension Usermanager {
  enum UserError: Error {
    
    case getUsersError
  }
}
