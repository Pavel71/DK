//
//  Postmanager.swift
//  First_Part
//
//  Created by PavelM on 29/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation
import Firebase

class Postmanager: FirebaseManager {
  
  private override init() {}
  
  static let shared = Postmanager()
  
  func createPost(from user: User, with text: String, completition: @escaping ResultClouser) {
    
    let newPostID = UUID().uuidString
    let post = Post(text: text)
    
    // проверям можем ли мы сериализовать объект!
    guard let dictioanry = post.dictionary else {
      completition(.failure(fatalError("Post model not Dictionary")))
      return
    }
    // Создаем новую ветку в user
    userRef.child(user.uid).child(Keys.posts.rawValue).child(newPostID).setValue(dictioanry) { (error, reference) in
      if let error = error {
        completition(.failure(error))
      } else {
        completition(.success("Post save in dataBase"))
      }
      
    }
  }
  
  func loadingAllPosts(complitition: @escaping (Result<Array<Post>,Error>) -> Void) {
    
    userRef.observe(.value) { (snapshot) in
      var result: [Post] = []
      guard let value = snapshot.value as? [[AnyHashable: Any]] else {
        complitition(.failure(fatalError("Post not exists")))
      }
      
      for element in value {
        if let postDictionaryArray  = (element[Keys.posts] as? [[AnyHashable: Any]]) {
          let posts = postDictionaryArray.compactMap {
            try? Post.init(from: $0)
          }
          result.append(contentsOf: posts)
        }
      }
      
      complitition(.success(result))
    }
    
  }
}

extension Postmanager {
  
  enum Keys: String {
    case posts
  }
  
}
