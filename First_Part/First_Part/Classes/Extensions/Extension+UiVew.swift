//
//  Extension+UiVew.swift
//  First_Part
//
//  Created by PavelM on 28/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

extension UIView {
    
    // Функция закругляет view
    func round() {
        
        layer.cornerRadius = frame.height / 2
    }
}
