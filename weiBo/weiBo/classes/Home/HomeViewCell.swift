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
fileprivate let itemMargin : CGFloat = 10

class HomeViewCell: UITableViewCell {
    
    // MARK:- 控件属性
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var verifiedView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var vipView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var picVIew: PicCollectionVIew!
    // MARK:- 约束的属性
    @IBOutlet weak var contentLabelWConstant: NSLayoutConstraint!
    @IBOutlet weak var picViewW: NSLayoutConstraint!
    @IBOutlet weak var picViewH: NSLayoutConstraint!
    
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
            
            // 9,计算picView宽度和高度
            let picViewSize = calculatePicViewSize(count: (viewModel.status?.pic_urls?.count)!)
            picViewH.constant = picViewSize.height
            picViewW.constant = picViewSize.width
            
            // 10, 将picURL数据传递给picView
            picVIew.picURLs = viewModel.picURLs
        }
    }

    
    // MARK:- 系统回掉函数（只写计算一次的属性，collection配图多少不确定，每次都要重新计算，所以计算配图宽高写在上边）
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // MARK:- 设置微博正文宽度约束
        contentLabelWConstant.constant = UIScreen.main.bounds.width - 2 * edgeMargin
        
        // MARK:- 设置流水布局，设置item的宽高
        let layout = picVIew.collectionViewLayout as! UICollectionViewFlowLayout
        let imageViewWH = (UIScreen.main.bounds.width - 2 * edgeMargin - 2 * itemMargin) / 3
        layout.itemSize = CGSize(width: imageViewWH, height: imageViewWH)
        
    }

}



    // MARK:- 计算方法
extension HomeViewCell{
    fileprivate func calculatePicViewSize(count : Int) -> CGSize{
        // 1,没有配图
        if count == 0{
            return CGSize(width: 0, height: 0)
        }
        
        // 2,计算imageViewWH
        let imageViewWH = (UIScreen.main.bounds.width - 2 * edgeMargin - 2 * itemMargin) / 3
        
        // 3,4张配图
        if count == 4{
            let picViewWH = imageViewWH * 2 + itemMargin
            return CGSize(width: picViewWH, height: picViewWH)
        }
        
        // 4,其他张配图
        // 4.1 计算行数
        let rows = CGFloat((count - 1) / 3 + 1)
        
        // 4.2 计算picView的高度
        let picViewH = rows * imageViewWH + (rows - 1) * itemMargin
        // 4.3 计算picView的宽度
        let picViewW = UIScreen.main.bounds.width - 2 * edgeMargin
        
        return CGSize(width: picViewW, height: picViewH)
        
    }
}
