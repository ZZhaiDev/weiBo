//
//  Statuses.swift
//  weiBo
//
//  Created by zijia on 2017/1/24.
//  Copyright © 2017年 zijia. All rights reserved.
//

import UIKit

class Statuses: NSObject {
    
    // MARK:- 属性： 
    var created_at : String?       //微博创建时间 Wed Jan 25 08:56:37 +0800 2017
    var source : String?           //微博来源
    var text : String?          //微博的正文
    var mid : Int = 0           //微博的ID
    

    var user : User?
    
    // MARK:- 自定义构造函数
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeys(dict)
        
        // 将用户字典转成用户模型
        if let userDict = dict["user"]{
            
            user = User.init(dict: userDict as! [String : AnyObject])
        }
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}

}
