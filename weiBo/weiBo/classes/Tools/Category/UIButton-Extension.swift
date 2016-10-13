//
//  UIButton-Extension.swift
//  weiBo
//
//  Created by zijia on 2016/10/12.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit


/* swift 中类方法以class开头， 类方法有返回值
 swift 中推荐使用构造方法， 没有返回值

extension UIButton{
    class func createButton(imageBtn: String, bgImageBtn: String) -> UIButton{
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageBtn), for: .normal)
        btn.setImage(UIImage(named: imageBtn + "highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named: bgImageBtn), for: .normal)
        btn.setBackgroundImage(UIImage(named: bgImageBtn + "highlighted"), for: .highlighted)
        
        btn.sizeToFit()
        return btn
    }
}
*/


// convenience : 便利,使用convenience修饰的构造函数叫做便利构造函数
// 便利构造函数通常用在对系统的类进行构造函数的扩充时使用
/*
 便利构造函数的特点
 1.便利构造函数通常都是写在extension里面
 2.便利构造函数init前面需要加载convenience
 3.在便利构造函数中需要明确的调用self.init()
 */


// 构造方法 ：：：

extension UIButton{
    
    convenience init(imageName: String, bgImageName: String){
        self.init()
        
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), for: .highlighted)
        sizeToFit()
    }
}




