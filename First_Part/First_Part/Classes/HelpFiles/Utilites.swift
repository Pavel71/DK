//
//  Utilites.swift
//  First_Part
//
//  Created by PavelM on 11/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation

func ID() -> String {
  
  let str = "asdasdasd0991823894123"
  let arr = Array(str)
  
  func random() -> String {
    // Вернет случайный символ
    return String(arr[Int.random(in: arr.indices)])
  }
  
  var result = ""
  let countOfCharacters = 12
  
  for _ in 0..<countOfCharacters {
    
    result += random()
  }
  
  return result
  
}
