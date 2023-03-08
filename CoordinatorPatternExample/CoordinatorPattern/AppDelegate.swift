//
//  AppDelegate.swift
//  CoordinatorPattern
//
//  Created by Anand Upadhyay on 07/03/23.
//  Copyright © 2023 Anand. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController()
        appCoordinator = AppCoordinator(navigationController: self.window?.rootViewController as! UINavigationController)
        appCoordinator?.start()
        self.window!.makeKeyAndVisible()
        return true
    }
}

