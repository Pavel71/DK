//
//  Post.swift
//  First_Part
//
//  Created by PavelM on 29/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation


class Post: Codable {
  
  enum `Type`: String, Codable {
    case text
    case textAndImage
    case image
  }
  var id: String
  var type: Type
  var text: String?
  var imageData: Data?
  var dateUnix: TimeInterval
  
  init() {
    self.id = UUID().uuidString
    self.dateUnix = Date().timeIntervalSince1970
    self.type = .text
  }
  
  convenience init(text: String) {
    self.init()
    self.text = text
  }
}
