//
//  UserInfoTableViewCell.swift
//  First_Part
//
//  Created by PavelM on 28/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
// TypeAliases
class UserInfoTableViewCell: UITableViewCell, StaticCellProtocol {
    
    // Это View с полями для ввода Данных
    @IBOutlet weak var backgroundFieldsView: UIView!
    // Я бы сюда добавил также и поле с Stack view!
    
    static var height: CGFloat {
        return 100
    }
    
    // Когда регистрируем nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Прорисовка
        Decorator.decorate(cell: self)
        
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}

// Создадим декортаор для прорисовки Нашей Ячейки

extension UserInfoTableViewCell {
    
    fileprivate class Decorator {
        
         static func decorate(cell: UserInfoTableViewCell) {
            
            cell.selectionStyle = .none
            // Настройка правой части с именим и паролем
            cell.backgroundFieldsView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            cell.backgroundFieldsView.layer.borderColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            cell.backgroundFieldsView.layer.borderWidth = 0.8
            // Общий фон всей ячейки
            cell.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            
        }
    }
}
