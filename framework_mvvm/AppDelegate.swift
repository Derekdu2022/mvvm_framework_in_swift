//
//  AppDelegate.swift
//  framework_mvvm
//
//  Created by Derek on 6/2/R4.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setup()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = LoginViewController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        return true
    }
    
    private func setup() {
        Session._shared = Session()
    }
    
}

