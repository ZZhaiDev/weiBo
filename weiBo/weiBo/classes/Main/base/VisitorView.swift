//
//  visitorView.swift
//  weiBo
//
//  Created by zijia on 2016/10/13.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class VisitorView: UIView {
 

    //MARK:- 快速提供通过xib创建的类方法
    class func visitorView() -> VisitorView{
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)?.first as! VisitorView
    }
    
    //MARK:- 空间的属性
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    
    
    func setUpVisitorViewInfo(iconViewName: String, tipLabelName: String){
        
        iconView.image = UIImage(named: iconViewName)
        tipLabel.text = tipLabelName
        rotationView.isHidden = true
        
    }
    
    func addRotationAnim() {
        // 1.创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 2.设置动画的属性
        rotationAnim.fromValue = 0
        rotationAnim.toValue = M_PI * 2
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 5
        rotationAnim.isRemovedOnCompletion = false
        
        // 3.将动画添加到layer中
        rotationView.layer.add(rotationAnim, forKey: nil)
    }
    
    
}
