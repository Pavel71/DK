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
    
    static var height: CGFloat {
        return 100
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
