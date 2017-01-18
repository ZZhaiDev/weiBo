//
//  UserAccountViewModel.swift
//  weiBo
//
//  Created by zijia on 2017/1/17.
//  Copyright © 2017年 zijia. All rights reserved.
//

import UIKit

class UserAccountViewModel: NSObject {
    
    // MARK:- 将类设计成单例
    static let shareInstance : UserAccountViewModel = UserAccountViewModel()
    
    var account : UserAccount?
    
    // MARK:- 计算属性
    var accountPath : String{
        let ap = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return (ap as NSString).appendingPathComponent("account.plist")
    }
    
    var isLogin : Bool{
        if account == nil{
            return false
        }
        
        guard let expired_date = account?.expires_date else {
            return false
        }
        return expired_date.compare(Date()) == ComparisonResult.orderedDescending
    }
    
    // MARK:- 重写init（）函数
     override init() {
        super.init()
        // 从沙盒中读取归档信息
        account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
    }
    

}
