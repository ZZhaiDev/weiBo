//
//  homeTableViewController.swift
//  weiBo
//
//  Created by zijia on 2016/9/30.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class homeTableViewController: BaseViewController {
    
    var isPresented : Bool = false

    // lazy load titleBtn
    fileprivate lazy var titleBtn : titleButton = titleButton()
    fileprivate lazy var popoverAnimator : PopoverAnimator = PopoverAnimator {[weak self] (presented) -> () in
        self?.titleBtn.isSelected = presented
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting when it is not login
        visitorView.addRotationAnim()
        if !isLogin{
            return
        }
        
        //set content of navigationBar
        setNavigationBar()
    }

   

}

extension homeTableViewController{
    
    fileprivate func setNavigationBar(){
        
        
        //自定义UIBarButtonItem(imageName: String)
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        // set titleView
        titleBtn.setTitle("coder", for: UIControlState())
        titleBtn.addTarget(self, action: #selector(tileBtnClick), for: .touchUpInside)
        navigationItem.titleView = titleBtn
    }
}


extension homeTableViewController{
    @objc fileprivate func tileBtnClick(titleBtn: titleButton){
        
        
        
        // create popViewController
       let popVc = PopoverViewController()
        
        // change controller modal style
        // 只有有了这句话，弹出controller 后边的的东西才不会消失
        popVc.modalPresentationStyle = .custom

        //set transition delegate
        popVc.transitioningDelegate = popoverAnimator
        
        // present controller
        present(popVc, animated: true, completion: nil)
        
            
        
        
    }
}


