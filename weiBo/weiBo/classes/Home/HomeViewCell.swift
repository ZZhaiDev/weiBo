//
//  HomeViewCell.swift
//  weiBo
//
//  Created by zijia on 2017/1/25.
//  Copyright © 2017年 zijia. All rights reserved.
//

import UIKit
import SDWebImage

fileprivate let edgeMargin : CGFloat = 15

class HomeViewCell: UITableViewCell {
    
    // MARK:- 控件属性
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var verifiedView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var vipView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK:- 约束的属性
    @IBOutlet weak var contentLabelWConstant: NSLayoutConstraint!
    
    // MARK:- 自定义属性
    var viewModel : StatusesViewModel? {
        didSet{
            // 1,nil值校验
            guard let viewModel = viewModel else{
                return
            }
            
            // 2,设置头像
            iconView.sd_setImage(with: viewModel.profileUrl! as URL, placeholderImage: UIImage(named: "avatar_default_small"))
            
            // 3，设置认证图标
            verifiedView.image = viewModel.verifiedImage
            
            // 4, 昵称
            screenNameLabel.text = viewModel.status?.user?.screen_name
            
            // 5,会员图标
            vipView.image = viewModel.vipImage
            
            // 6,设置时间的label
            timeLabel.text = viewModel.createAtText
            
            // 7,设置来源
            contentLabel.text = viewModel.status?.text
            
            // 8,设置昵称颜色
            screenNameLabel.textColor = viewModel.vipImage == nil ? UIColor.black : UIColor.orange
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // MARK:- 设置微博正文宽度约束
        contentLabelWConstant.constant = UIScreen.main.bounds.width - 2 * edgeMargin
        
    }

}
