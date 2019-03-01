//
//  NewLoadoable.swift
//  First_Part
//
//  Created by PavelM on 28/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

protocol NibLoadable: class {
    
    static var nib: UINib { get }
}

// Это расширение дает вычесляемый nib для каждого класс
extension NibLoadable {
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.init(for: self))
    }
    
    static var name: String {
        return String(describing: self)
    }
    
}

// Это расширение дает функцию которая возвращает View
// Класс должен быть View и идет проверка на отношение nib файла и controllera

extension NibLoadable where Self: UIView {
    
    static func loadFromNib() -> Self {
        
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {fatalError()}
        return view
    }
}
