//
//  MyNavigationViewController.swift
//  TouTiao
//
//  Created by Henry Li on 2019/2/20.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import UIKit

class MyNavigationViewController: UINavigationController,UINavigationControllerDelegate {


    var popDelegate:UIGestureRecognizerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        //navigationBar字体颜色设置
        self.navigationBar.barTintColor = UIColor.white
        //navigationBar字体颜色设置
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
        
 
        self.navigationBar.setBackgroundImage(UIImage(named: "touming.jpg"), for: .default)
        self.navigationBar.shadowImage = UIImage(named: "touming.jpg")
    }
    
    //MARK: - UIGestureRecognizerDelegate代理
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        //实现滑动返回的功能
        //清空滑动返回手势的代理就可以实现
        if viewController == self.viewControllers[0] {
            
            self.interactivePopGestureRecognizer?.delegate = self.popDelegate
            
        } else {
            
            self.interactivePopGestureRecognizer?.delegate = nil;
        }
    }
    
    //拦截跳转事件
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.children.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            //添加图片
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_left_back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(leftClick))
            //添加文字
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "返回", style: .plain, target: self, action: #selector(leftClick))
        }
        super.pushViewController(viewController, animated: animated)
        
    }
    
    //返回上一层控制器
    @objc func leftClick()  {
        
        popViewController(animated: true)
        
    }
    

   

}
