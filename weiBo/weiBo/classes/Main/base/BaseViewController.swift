//
//  BaseViewController.swift
//  weiBo
//
//  Created by zijia on 2016/10/12.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {

    //MARK:- 懒加载属性
    lazy var visitorView: VisitorView = VisitorView.visitorView()

    // 定义变量
    var isLogin : Bool = false
    
    override func loadView() {
        
        // 1.从沙盒中读取中归档的信息
        // 1.1.获取沙盒路径
        var accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        accountPath = (accountPath as NSString).appendingPathComponent("accout.plist")
        
        // 1.2.读取信息
        let account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
        if let account = account {
            
            // 1.3.取出过期日期 : 当前日期
            if let expiresDate = account.expires_date {
                isLogin = expiresDate.compare(Date()) == ComparisonResult.orderedDescending
            }
        }
        
        // 判断要加载哪一个View
        
        
        isLogin ? super.loadView() : setUpVisitorView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpNavigationItem()
     
    }
 
}

extension BaseViewController{
    fileprivate func setUpVisitorView(){
        view = visitorView
        visitorView.registerBtn.addTarget(self, action: #selector(registerBtnClick), for: .touchUpInside)
        visitorView.loginBtn.addTarget(self, action: #selector(logInBtnClick), for: .touchUpInside)
    }
    
    
    // left and right barButtonItem
    fileprivate func setUpNavigationItem(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "register", style: .plain, target: self, action: #selector(BaseViewController.registerBtnClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "login", style: .plain, target: self, action: #selector(logInBtnClick))
    }
}

extension BaseViewController{
    @objc fileprivate func registerBtnClick(){
        print("registerBtnClick")
    }
    
    @objc fileprivate func logInBtnClick(){
        let oauthVc = OAuthViewController()
        let naviVc = UINavigationController(rootViewController: oauthVc)
        present(naviVc, animated: true, completion: nil)
    }
}
