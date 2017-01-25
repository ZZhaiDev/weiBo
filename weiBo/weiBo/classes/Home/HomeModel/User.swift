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
    var profile_image_url : String?
    var screen_name : String?
    
    // MARK:- 对数据处理
    var verifiedImage : UIImage?
    var vipImage : UIImage?
    
    init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}

}
