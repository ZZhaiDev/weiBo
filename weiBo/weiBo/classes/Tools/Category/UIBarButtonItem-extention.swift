//
//  UIBarButtonItem-extention.swift
//  weiBo
//
//  Created by zijia on 2016/11/21.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    convenience init(imageName: String) {
        let btn = UIButton()
       
        btn.setImage(UIImage(named: imageName), for: UIControlState())
        btn.setImage(UIImage(named: imageName + "_lighted"), for: .highlighted)
        btn.sizeToFit()
        
        self.init(customView: btn)
    }
    
}
