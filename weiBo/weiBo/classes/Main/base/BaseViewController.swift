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
    var isLogin : Bool = true
    
    override func loadView() {
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
        print("logInBtnClick")
    }
}
