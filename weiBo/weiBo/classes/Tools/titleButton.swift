//
//  titleButton.swift
//  weiBo
//
//  Created by zijia on 2016/11/21.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class titleButton: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
        
        setImage(UIImage(named: "navigationbar_arrow_down"), for: UIControlState())
        setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
        setTitleColor(UIColor.black, for: UIControlState())
        sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.frame.origin.x = 0
        self.imageView?.frame.origin.x = (titleLabel?.frame.size.width)! + 7
    }

}
