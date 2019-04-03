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

  
  private init() {}
  
  var startControleerAfterAuth: UIViewController {
    
    let createPostVC = CreatePostViewController()
    let createPostNC = UINavigationController(rootViewController: createPostVC)
    let createTabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
    createPostNC.tabBarItem = createTabBarItem
    
    let feedVC = FeedViewController()
    let feedNC = UINavigationController(rootViewController: feedVC)
    let feedTabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    feedNC.tabBarItem = feedTabBarItem
    
    let chatsVC = ChatViewController()
    let chatsNC = UINavigationController.init(rootViewController: chatsVC)
    let chatsTabbarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
    chatsNC.tabBarItem = chatsTabbarItem
    
    
    
    let tabBarVC = UITabBarController()
    tabBarVC.setViewControllers([feedNC, chatsNC, createPostNC], animated: true)

    
    return tabBarVC
  }
  

  
  func root (window: inout UIWindow?) {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    let vc = SecureStorageManager.shared.isLoggedIn() ? startControleerAfterAuth : ViewController()
    
    print(vc)
 
    window?.rootViewController = UINavigationController(rootViewController: vc)
  }
  
  
  
}
