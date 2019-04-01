//
//  Extensions+Codable.swift
//  First_Part
//
//  Created by PavelM on 29/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation

extension Encodable {
  
  var dictionary: [String: Any]? {
    
    guard let data = try? JSONEncoder().encode(self) else {return nil}
    
    let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
    let dictData = jsonData.flatMap{$0 as? [String: Any]}
    
    return dictData
  }
}
