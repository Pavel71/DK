//
//  Router.swift
//  First_Part
//
//  Created by PavelM on 28/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class Router {
    
    static let shared = Router()
    private let rootViewController: UIViewController = ViewController()
    
    private init() {}
    
    func root (window: inout UIWindow?) {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
    }
}
