//
//  AppDelegate.swift
//  ShuffleSongs
//
//  Created by André Alves on 09/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let searchCoordinator = SearchCoordinator(navigationController: UINavigationController())
        searchCoordinator.start()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = searchCoordinator.navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
