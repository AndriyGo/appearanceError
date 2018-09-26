//
//  AppDelegate.swift
//  appearanceError
//
//  Created by Andriy Gordiychuk on 26/09/2018.
//  Copyright © 2018 Glenmax Ltd. All rights reserved.
//

import UIKit

final class GLXNavigationController: UINavigationController {
    
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var navC:GLXNavigationController = {
        let navC = GLXNavigationController()
        navC.restorationIdentifier = "navC"
        return navC
    }()


    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).font = UIFont.systemFont(ofSize: 12)
        UINavigationBar.appearance(whenContainedInInstancesOf: [GLXNavigationController.self]).isTranslucent = false
        window?.rootViewController = navC
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if navC.viewControllers.count == 0 {
            let vc = ViewController()
            navC.viewControllers = [vc]
        }
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }

    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
        return navC
    }

}

