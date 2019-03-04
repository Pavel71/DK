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
    
    static var height: CGFloat {
        
        return 100
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        Decorator.decorate(cell: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

// Реализуем разрисовку нашей ячейки при вызове xib

extension SexTableViewCell {
    
    fileprivate class Decorator {
        
        static func decorate(cell: SexTableViewCell) {
            // Не выбранна по умолчанию
            cell.selectionStyle = .none
            // Общий фон всей ячейки
            cell.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        }
    }
}
