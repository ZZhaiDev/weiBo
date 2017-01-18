//
//  UserAccount.swift
//  weiBo
//
//  Created by zijia on 2017/1/3.
//  Copyright © 2017年 zijia. All rights reserved.
//

import UIKit

class UserAccount: NSObject,NSCoding {
    
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
    
    // MARK:- 归档&解档 archive
    //解档
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        expires_date = aDecoder.decodeObject(forKey: "expires_date") as? NSDate
        avatar_large = aDecoder.decodeObject(forKey: "avatar_large") as? String
        screen_name = aDecoder.decodeObject(forKey: "screen_name") as? String
    }
    // 归档方法
    func encode(with aCoder: NSCoder) {
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(expires_date, forKey: "expires_date")
        aCoder.encode(avatar_large, forKey: "avatar_large")
        aCoder.encode(screen_name, forKey: "screen_name")
    }
    
   

}
