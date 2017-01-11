//
//  UserAccount.swift
//  weiBo
//
//  Created by zijia on 2017/1/3.
//  Copyright © 2017年 zijia. All rights reserved.
//

import UIKit

class UserAccount: NSObject {
    
    // MARK:- 属性
    ///oauth AccessToken
    var access_token : String?
    
    /// expired time second
    var expires_in : TimeInterval = 0.0{
        didSet{
            //once expires_in is called, expires_date will be updated.
            expires_date = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    ///expired date
    var expires_date : NSDate?
    
    ///user ID
    var uid : String?
    
    /// 昵称
    var screen_name : String?
    
    /// 用户头像地址
    var avatar_large : String?
    
    // MARK:- 自定义构造函数
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
    // 重写override方法，否则只能打印内存地址
    override var description: String{
        return dictionaryWithValues(forKeys: ["access_token", "expires_date", "uid", "screen_name", "avatar_large"]).description
    }

}
