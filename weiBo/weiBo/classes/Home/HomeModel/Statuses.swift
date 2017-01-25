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
    var created_at : String?{       //微博创建时间 Wed Jan 25 08:56:37 +0800 2017
        didSet{
            guard  let created_at = created_at else {
                return
            }
            
            // 2,对时间处理
            createAtText = NSDate.createDateString(createAtStr: created_at)
            
            
        }
    }
    var source : String?{       //微博来源
        //<a href=\"http://app.weibo.com/t/feed/6vtZb0\" rel=\"nofollow\">微博 weibo.com</a>
        didSet{
            // 1, nil值校验(source != "")要判断，此为微博的坑
            guard let source = source, source != "" else{
                return
            }
            // 2, 对source处理（ //<a href=\"http://app.weibo.com/t/feed/6vtZb0\" rel=\"nofollow\">微博 weibo.com</a>）
            let startIndex = (source as NSString).range(of: ">").location + 1
            let length = (source as NSString).range(of: "</").location - startIndex
            sourceText = (source as NSString).substring(with: NSRange(location: startIndex, length: length))
        }
    }
    var text : String?          //微博的正文
    var mid : Int = 0           //微博的ID
    
    
    // MARK:- 属性处理
    var sourceText : String?
    var createAtText : String?
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
