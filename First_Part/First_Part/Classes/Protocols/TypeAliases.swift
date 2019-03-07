//
//  TypeAliases.swift
//  First_Part
//
//  Created by PavelM on 28/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation


typealias StaticCellProtocol = NibLoadable & HeightContainable

// Дженерик Clouser
typealias ItemClouser<T> = ((T) -> Void)
typealias VoidClouser = (() -> Void)
