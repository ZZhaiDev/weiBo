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
    //oauth AccessToken
    var access_token : String?
    
    // expired time second
    var expires_in : TimeInterval = 0.0
    
    //ID
    var uid : String?
    
    // MARK:- 自定义构造函数
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
    
    override var description: String{
        return dictionaryWithValues(forKeys: ["access_token", "expires_in", "uid"]).description
    }

}
