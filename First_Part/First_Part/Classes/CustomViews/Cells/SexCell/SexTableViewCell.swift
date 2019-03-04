//
//  SexTableViewCell.swift
//  First_Part
//
//  Created by PavelM on 04/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

// Сделаю вторую ячейку для table View
class SexTableViewCell: UITableViewCell, StaticCellProtocol {
  
  @IBOutlet weak var sexSegment: UISegmentedControl!
  
  var indexChanged: ItemClouser<Int>?
  
  
  
  static var height: CGFloat {
    
    return 100
    
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    // Вешаем метод на загрузку из nib
    addTargets()
    
    Decorator.decorate(cell: self)
  }
  
  private func addTargets() {
    
    sexSegment.addTarget(self, action: #selector(chooseSexSegment(sender:)), for: .valueChanged)
  }
  
  @objc private func chooseSexSegment(sender: UISegmentedControl) {
    indexChanged?(sender.selectedSegmentIndex)
    
  }
  
  
  // Возможно решение не передавать на него ссылку а запилить Clouser
  
  
}

// Реализуем разрисовку нашей ячейки при вызове xib

extension SexTableViewCell {
  
  fileprivate class Decorator {
    
    static func decorate(cell: SexTableViewCell) {
      // Не выбранна по умолчанию
      cell.selectionStyle = .none
      // Общий фон всей ячейки
      cell.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
      
      
      cell.sexSegment.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
      
    }
  }
}
