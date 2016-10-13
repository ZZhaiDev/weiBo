//
//  BaseViewController.swift
//  weiBo
//
//  Created by zijia on 2016/10/12.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view  = VisitorView.visitorView()

    }

}
