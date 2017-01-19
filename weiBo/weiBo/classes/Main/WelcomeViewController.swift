//
//  WelcomeViewController.swift
//  weiBo
//
//  Created by zijia on 2017/1/18.
//  Copyright © 2017年 zijia. All rights reserved.
//

import UIKit
import SDWebImage

class WelcomeViewController: UIViewController {

    // MARK:- 拖线属性
    
    @IBOutlet weak var iconVIewBottomCons: NSLayoutConstraint!
    @IBOutlet weak var iconView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: UserAccountViewModel.shareInstance.account?.avatar_large ?? "")
        iconView.sd_setImage(with: url as! URL, placeholderImage: UIImage(named: "avatar_default_big"))

        //1. 改变约束值
        iconVIewBottomCons.constant = UIScreen.main.bounds.height - 250
        // 2.执行动画
        // damping: 阻力系数，阻力系数越大，弹动效果越不明显 0～1
       UIView.animate(withDuration: 2.3, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 4, options: [], animations: { 
        self.view.layoutIfNeeded()
        }) { (Bool) in
            
        }
        
    }


}
