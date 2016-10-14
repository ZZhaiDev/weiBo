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
        isLogin ? super.loadView() : setUpVisitorView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
 
}

extension BaseViewController{
    fileprivate func setUpVisitorView(){
        view = visitorView
    }
}
