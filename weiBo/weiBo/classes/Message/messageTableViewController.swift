//
//  messageTableViewController.swift
//  weiBo
//
//  Created by zijia on 2016/9/30.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class messageTableViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        visitorView.setUpVisitorViewInfo(iconViewName: "visitordiscover_image_message", tipLabelName: "登录后，别人评论你的微博，给你发消息，都会在这里收到通知")
    }

}
