//
//  mainViewController.swift
//  weiBo
//
//  Created by zijia on 2016/9/30.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class mainViewController: UITabBarController {

    
    fileprivate lazy var composeBtn : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     setUpcompseBtn()
    
    }

    
    

}

extension mainViewController{
    
    fileprivate func setUpcompseBtn(){
        
        
        // disable the tabBar item in null.storyboard
        
        tabBar.addSubview(composeBtn)
        
        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        composeBtn.sizeToFit()
        
        composeBtn.center = CGPoint(x: tabBar.center.x  , y: tabBar.bounds.size.height * 0.5)
    }
}

