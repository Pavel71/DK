//
//  HeaderTtileView.swift
//  First_Part
//
//  Created by PavelM on 04/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class HeaderTitleView: UIView, NibLoadable {
    
    
    @IBOutlet private weak var headerLabel: UILabel!
    
    func setTitle(title: String) {
        
        headerLabel.text = title
    }

}
