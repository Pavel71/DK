//
//  BirthdayTableViewCell.swift
//  First_Part
//
//  Created by PavelM on 04/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class BirthdayTableViewCell: UITableViewCell, NibLoadable {
  
  @IBOutlet weak var birthdayTextField: UITextField!
  @IBOutlet private weak var label: UILabel!
  
  
  
  func set(text: String) {
    label.text = text
    label.font = UIFont.init(name: "system", size: 17)
    label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  }
    
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.selectionStyle = .none
    // Общий фон всей ячейки
    self.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
    
  }
  
  
  
}
