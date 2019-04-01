//
//  AppDelegate.swift
//  First_Part
//
//  Created by PavelM on 28/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    Router.shared.root(window: &window)
    FirebaseApp.configure()
    AuthManager.shared.signInIfNeeded()
//    SecureStorageManager.shared.eraseUserDataIfNeeded()
    
    return true
  }
  
  
  
}

