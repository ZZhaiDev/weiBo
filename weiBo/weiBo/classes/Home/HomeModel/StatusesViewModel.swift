//
//  StatusesViewModel.swift
//  weiBo
//
//  Created by zijia on 2017/1/25.
//  Copyright © 2017年 zijia. All rights reserved.
//

import UIKit

class StatusesViewModel: NSObject {
    
    // MARK:- 定义属性
    var status : Statuses?
    
    // MARK:- 对数据处理的属性
    var sourceText : String?            // 处理来源
    var createAtText : String?          // 处理创建时间
    var verifiedImage : UIImage?        // 处理用户认证图标
    var vipImage : UIImage?             // 处理用户会员等
    var profileUrl : NSURL?             // 处理用户头像地址
    var picURLs : [NSURL] = [NSURL]()   //处理微博配图的数据
    
    // MARK:- 自定义构造函数
    init(status : Statuses) {
        self.status = status
        
        // 1,对来源处理 对source处理（ //<a href=\"http://app.weibo.com/t/feed/6vtZb0\" rel=\"nofollow\">微博 weibo.com</a>
        if let source = status.source, source != "" {
            // 1.1 获取起始位置和截取的长度
            let startIndex = (source as NSString).range(of: ">").location + 1
            let length = (source as NSString).range(of: "</").location - startIndex
            // 1.2 截取字符串长度
            sourceText = (source as NSString).substring(with: NSRange(location: startIndex, length: length))
            
        }
        
        // 2,时间处理
        if let createAt = status.created_at{
            createAtText = NSDate.createDateString(createAtStr: createAt)
        }
        
        // 3.处理认证
        let verifiedType = status.user?.verified_type ?? -1
        switch verifiedType {
        case 0:
            verifiedImage = UIImage(named: "avatar_vip")
        case 2, 3, 5:
            verifiedImage = UIImage(named: "avatar_enterprise_vip")
        case 220:
            verifiedImage = UIImage(named: "avatar_grassroot")
        default:
            verifiedImage = nil
        }
        
        // 4,处理会员图标
        let mbrank = status.user?.mbrank ?? 0
        if mbrank > 0 , mbrank <= 6 {
            vipImage = UIImage(named: "common_icon_membership_level\(mbrank)")
        }
        
        // 5,用户头像处理
        let profileUrlString = status.user?.profile_image_url ?? ""
        profileUrl = NSURL(string: profileUrlString)
        
        // 6, 处理配图数据
        if let picURLDicts = status.pic_urls{
            for picURLDict in picURLDicts{
                guard  let pictUrlString = picURLDict["thumbnail_pic"] else {
                    continue
                }
                picURLs.append(NSURL(string: pictUrlString)!)
            }
        }
    }

}
