//
//  ChatManager.swift
//  First_Part
//
//  Created by PavelM on 03/04/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation


final class ChatManager: FirebaseManager {
  
  static let shared = ChatManager()
  
  func send(message: Message) {
    
    guard let dict = message.dictionary else {
      return
    }
    sourceRef.child(message.id).setValue(dict)
  }
  
}
