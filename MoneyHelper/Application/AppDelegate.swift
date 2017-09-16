//
//  AppDelegate.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16.09.17.
//Copyright © 2017 Kirill Klebanov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        UIApplication.shared.statusBarStyle = .lightContent
        openScreen()
        return true
    }

    func openScreen() {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.rootViewController = IntroModuleConfigurator().configure()
        window?.makeKeyAndVisible()
    }

}
