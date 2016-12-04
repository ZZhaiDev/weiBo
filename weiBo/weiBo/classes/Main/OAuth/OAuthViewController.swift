//
//  OAuthViewController.swift
//  weiBo
//
//  Created by zijia on 2016/12/3.
//  Copyright © 2016年 zijia. All rights reserved.
//


//  used javascript to auto fill in the account and password info, ..... got the appkey, appsecret, redirecturi, from API, and stored in the common.swift file....  used webViewDelegate to get web address and intercept  the "code" and accessToken, used to request datas from server.

import UIKit
import SVProgressHUD

class OAuthViewController: UIViewController {

    // MARK:- 控件的属性
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationItems()
        
        // MARK:- load webView

        loadWebView()
        
    }

}


// MARK:- setting UI-----navigationItem
extension OAuthViewController{
    
    fileprivate func setupNavigationItems(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "close", style: UIBarButtonItemStyle.plain, target: self, action: #selector(closeBtnClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "autoFill", style: .plain, target: self, action: #selector(autoFillIn))
        
        title = "logIn page"
    }
    
    
    // load webView
    fileprivate func loadWebView(){
        
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(app_key)&redirect_uri=\(redirect_uri)"
        let url = NSURL(string: urlString)
        let request = NSURLRequest(url: url as! URL)
        webView.loadRequest(request as URLRequest)
    }
}

// MARK:- 	event listeners// 事件监听
extension OAuthViewController{
    
    @objc fileprivate func closeBtnClick(){
        
        dismiss(animated: true, completion: nil)
    }
    
    // 自动填充账号密码。。。
    @objc fileprivate func autoFillIn(){
        // 1.书写js代码 : javascript / java --> 雷锋和雷峰塔
        let jsCode = "document.getElementById('userId').value='18510060862';document.getElementById('passwd').value='gjw18510060862';"
        
        // 2.执行js代码
        webView.stringByEvaluatingJavaScript(from: jsCode)
    }
}


// MARK:- webViewDelegate: setting SVProgressHUD
extension OAuthViewController : UIWebViewDelegate{
    
    // start to load webView::: show the SVProgressHUD
    func webViewDidStartLoad(_ webView: UIWebView) {

            SVProgressHUD.show()
    }
    // finish to load webView::: dismiss the SVProgressHUD
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    // fail to load webView::: dismiss the SVProgressHUD
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.dismiss()
    }
    
    // 当准备加载某一个页面时，会执行该方法
    //返回值为true时会继续加载页面。。。 返回值为false时 不会再加在页面
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
      //  1. 获取加载网页的NSURl
        // if we can not get the url, continue...
        guard let url = request.url else{
            return true
        }
       //2. convert the url to String.. 获取url中转成String
        let urlString = url.absoluteString
        
        //3. check if the string contains"code"
        guard  urlString.contains("code=") else {
            return true
        }
        
        //4, if we get the url, and url contains "code=", then we intercept(截取) the components after "code="
        let code = urlString.components(separatedBy: "code=").last

        //5. request accessToken
        requestAccessToken(code: code!)
        
        return false
    }
  
    
}

// MARK:- request for accessToken
extension OAuthViewController{
    fileprivate func requestAccessToken(code: String){
        
       NetworkTools.shareInstance.loadAccessToken(code: code) { (result, error) in
        
        // if its error, return
        if error != nil{
            print(error)
            return
        }
        
        // get the result
        print(result)
    
        }
    }
}
