//
//  MyTabbarViewController.swift
//  TouTiao
//
//  Created by Henry Li on 2019/2/20.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import UIKit

class MyTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addChildViewControllers()
        
    }
    
    //添加自控制器
    func addChildViewControllers() {
        
        setChildViewController(HomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectedImageName: "home_tabbar_press_32x32_")
        setChildViewController(VideoViewController(), title: "视频", imageName: "video_tabbar_32x32_", selectedImageName: "video_tabbar_press_32x32_")
        setChildViewController(HuoshanViewController(), title: "小视频", imageName: "huoshan_tabbar_32x32_", selectedImageName: "huoshan_tabbar_press_32x32_")
        setChildViewController(MineViewController(), title: "我的", imageName: "mine_tabbar_32x32_", selectedImageName: "mine_tabbar_press_32x32_")
        // tabBar 是 readonly 属性，不能直接修改，利用 KVC 把 readonly 属性的权限改过来
        setValue(MyTabBar(), forKey: "tabBar")
    }
   //初始化自控制器
    func setChildViewController(_ childController: UIViewController, title: String, imageName: String, selectedImageName: String) {
        //设置 tabbar 文字和图片
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.title = title
        childController.tabBarItem.selectedImage = UIImage (named: selectedImageName)
        childController.view.backgroundColor = UIColor.white
        //添加 导航控制器为 TabBarController 的子控制器
        let NavVC = MyNavigationViewController(rootViewController: childController)
        
        addChild(NavVC)
        
    }

}
