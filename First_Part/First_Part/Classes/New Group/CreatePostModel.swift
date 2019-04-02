//
//  CreatePostModel.swift
//  First_Part
//
//  Created by PavelM on 02/04/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

final class CreatePostModel {
  
  private (set) var text: String?
  private (set) var image: UIImage?
  
  func setText(text: String) {
    self.text = text
  }
  
  var imageData: Data? {
    return image?.jpegData(compressionQuality: 0.5)
  }
  
  var isFiled: Bool {
    return text != nil
  }
}
