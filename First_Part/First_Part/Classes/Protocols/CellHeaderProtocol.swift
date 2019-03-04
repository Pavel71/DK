//
//  CellHeaderProtocol.swift
//  First_Part
//
//  Created by PavelM on 04/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation


protocol CellHeaderProtocol {
    associatedtype CellType
    
    var cellModel:[CellType] {get}
    
}
