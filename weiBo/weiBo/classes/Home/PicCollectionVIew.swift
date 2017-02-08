//
//  PicCollectionVIew.swift
//  weiBo
//
//  Created by zijia on 2017/2/7.
//  Copyright © 2017年 zijia. All rights reserved.
//


/**
 一般情况下是要collectionView的父控件成为数据源（也就是cell）但是HomeViewCell里边已经写了太多代码了
 所以我们自定义PicCollectionVIew，让自己成为数据源
 */
import UIKit

class PicCollectionVIew: UICollectionView {

    // MARK:- 定义属性
    var picURLs : [NSURL] = [NSURL](){
        didSet {
            self.reloadData()
        }
    }
    
    
    // MARK:- 系统回掉函数
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 叫自己成为数据源 封装起来
        dataSource = self
    }

}

// 成为数据源dataSource = self， 必须遵守协议UICollectionViewDataSource，实现方法
extension PicCollectionVIew : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! PicCollectionCell
        cell.picURL = picURLs[indexPath.item]
        return cell
    }
}



// MARK:- 自定义cell

class PicCollectionCell : UICollectionViewCell{
    // MARK:- 定义模型属性
    var picURL : NSURL? {
        didSet{
            guard let picURL = picURL else{
                return
            }
        iconView.sd_setImage(with: picURL as URL, placeholderImage: UIImage(named: "empty_picture"))
        }
    }
    
    // MARK:- 控件的属性
    @IBOutlet weak var iconView: UIImageView!
}
