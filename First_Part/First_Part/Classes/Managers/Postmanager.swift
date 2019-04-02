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
  
  func createPostModel(from user: User, with model: CreatePostModel, completition: @escaping ResultClouser) {
    
    guard model.isFiled else {
      completition(.failure(fatalError("Canot create emty post")))
      return
    }
    createPost(from: user, with: model.text!, completition: completition)
  }
  
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
      
      // 1. Что если рпинять все данные в виде json и обработать их?
      // 2. Првильным решением будет создать структуру аналогичную json словарю!
      

  
      guard let value = snapshot.value as? [String: [AnyHashable: Any]] else {
        complitition(.failure(fatalError("Post not exists")))
      }

      
      let allKeys = value.keys
      allKeys.forEach({ (key) in
        if let element = value[key], let postDictionaryArray = (element[Keys.posts.rawValue] as? [String: [AnyHashable: Any]]) {

          
          let posts = postDictionaryArray.compactMap {

            try? Post.init(from: $0.value)
          }
          result.append(contentsOf: posts)
        }
      })

      complitition(.success(result))
    }
    
  }
}

extension Postmanager {
  
  enum Keys: String {
    case posts
  }
  
}
