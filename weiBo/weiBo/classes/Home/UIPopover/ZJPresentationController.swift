//
//  ZJPresentationController.swift
//  weiBo
//
//  Created by zijia on 2016/11/23.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class ZJPresentationController: UIPresentationController {
    
    fileprivate lazy var coverView = UIView()
    
    
    //  在containerViewWillLayoutSubviews中 设置弹出view的尺寸
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        // 设置弹出view的尺寸
        presentedView?.frame = CGRect(x: 100, y: 55, width: 180, height: 250)
        
        // 添加蒙版
        setupCoverView()
    }

   
}

extension ZJPresentationController{
    fileprivate func setupCoverView(){
        
        // set coverView color and frame
        containerView?.insertSubview(coverView, at: 0)
        coverView.backgroundColor = UIColor(white: 0.9, alpha: 0.2)
        coverView.frame = (containerView?.bounds)!
        
        // 添加手势
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(coverViewClick))
        coverView.addGestureRecognizer(tapGes)
    }
}

extension ZJPresentationController{
    @objc fileprivate func coverViewClick(){
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
