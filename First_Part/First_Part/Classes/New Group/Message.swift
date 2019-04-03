//
//  Message.swift
//  First_Part
//
//  Created by PavelM on 03/04/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation

final class Message: Codable {
  
  var id: String
  var senderId: String?
  var text: String?
  var time: TimeInterval?
  
  init() {
    
    self.id = UUID().uuidString
  }
}
