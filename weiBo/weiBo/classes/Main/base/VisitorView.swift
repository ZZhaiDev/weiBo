//
//  visitorView.swift
//  weiBo
//
//  Created by zijia on 2016/10/13.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class VisitorView: UIView {

//    class func visitorView() -> VisitorView{
//        
//        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)!.first as! VisitorView
//    }

    
    class func visitorView() -> VisitorView{
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)?.first as! VisitorView
    }
}
