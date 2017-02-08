//
//  AppDelegate.swift
//  weiBo
//
//  Created by zijia on 2016/9/29.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var defaultController : UIViewController? {
        let isLogin = UserAccountViewModel.shareInstance.isLogin
        return isLogin ? WelcomeViewController() : UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        // globle color 
        
        UITabBar.appearance().tintColor = UIColor.orange
        UINavigationBar.appearance().tintColor  = UIColor.orange
        
        
     print(NSHomeDirectory())
    print(UserAccountViewModel.shareInstance.account?.access_token)
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = defaultController
        window?.makeKeyAndVisible()

        

        
        
        return true
    }

    

}

