//
//  User.swift
//  weiBo
//
//  Created by zijia on 2017/1/25.
//  Copyright © 2017年 zijia. All rights reserved.
//

import UIKit

class User: NSObject {
    
    // MARK:- 属性
    var profile_image_url : String?     //用户头像
    var screen_name : String?           //用户昵称
    var verified_type : Int = -1       //用户认证类型
    var mbrank : Int = 0               //用户会员等级
        
    
    
    init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}

}
