//
//  mainViewController.swift
//  weiBo
//
//  Created by zijia on 2016/9/30.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class mainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       addChildViewController(childController: homeTableViewController(), title: "HOME", imageName: "tabbar_home")
        addChildViewController(childController: messageTableViewController(), title: "Message", imageName: "tabbar_message_center")
        addChildViewController(childController: discoverTableViewController(), title: "Discover", imageName: "tabbar_discover")
        addChildViewController(childController: profileTableViewController(), title: "Profile", imageName: "tabbar_profile")
        
     
    }
    
   private func addChildViewController( childController: UIViewController, title: String, imageName: String) {
    
    
    
    
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
    
        
        let childNav = UINavigationController(rootViewController: childController)
        addChildViewController(childNav)
    }
    

   

}
