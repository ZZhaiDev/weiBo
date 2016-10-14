//
//  profileTableViewController.swift
//  weiBo
//
//  Created by zijia on 2016/9/30.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class profileTableViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        visitorView.setUpVisitorViewInfo(iconViewName: "visitordiscover_image_profile", tipLabelName: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
        
    }

}
