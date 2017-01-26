//
//  homeTableViewController.swift
//  weiBo
//
//  Created by zijia on 2016/9/30.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class homeTableViewController: BaseViewController {
    
    var isPresented : Bool = false

    // lazy load titleBtn
    fileprivate lazy var titleBtn : titleButton = titleButton()
    fileprivate lazy var popoverAnimator : PopoverAnimator = PopoverAnimator {[weak self] (presented) -> () in
        self?.titleBtn.isSelected = presented
    }
    
    //创建数组，存储数据
    fileprivate lazy var viewModels : [StatusesViewModel] = [StatusesViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting when it is not login
        visitorView.addRotationAnim()
        if !isLogin{
            return
        }
        
        //set content of navigationBar
        setNavigationBar()
        
        // 3,请求数据
        loadStatuses()
    }

   

}

extension homeTableViewController{
    
    fileprivate func setNavigationBar(){
        
        
        //自定义UIBarButtonItem(imageName: String)
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        // set titleView
        titleBtn.setTitle("coder", for: UIControlState())
        titleBtn.addTarget(self, action: #selector(tileBtnClick), for: .touchUpInside)
        navigationItem.titleView = titleBtn
    }
}


extension homeTableViewController{
    @objc fileprivate func tileBtnClick(titleBtn: titleButton){
        
        
        
        // create popViewController
       let popVc = PopoverViewController()
        
        // change controller modal style
        // 只有有了这句话，弹出controller 后边的的东西才不会消失
        popVc.modalPresentationStyle = .custom

        //set transition delegate
        popVc.transitioningDelegate = popoverAnimator
        
        // present controller
        present(popVc, animated: true, completion: nil)
        
            
        
        
    }
}

// MARK:- 请求数据

extension homeTableViewController{
    fileprivate func loadStatuses(){
        
      
        NetworkTools.shareInstance.loadStatuses { (result, error) in
            // 1,错误校验
            if error != nil{
                print(error)
                return
            }
            
            // 2,获取可选类型中的数据
            guard let resultDict = result else{
                return
            }
            
            // 3,遍历微博对应字典
            for statusesDict in resultDict{
                let status = Statuses(dict: statusesDict)
                let viewModel = StatusesViewModel(status: status)
                self.viewModels.append(viewModel)
            }
            
            
            // 4, 刷新表格
            print("reloadData")
            self.tableView.reloadData()
        }
    }
}

// MARK:- tableView的数据源方法
extension homeTableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1,创建cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeViewCell
        
        // 2,给cell设置数据
        cell.viewModel = viewModels[indexPath.row]
     
        
        
        return cell
    }
}


