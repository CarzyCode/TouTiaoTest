//
//  MyTabBar.swift
//  TouTiao
//
//  Created by Henry Li on 2019/2/25.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import UIKit

class MyTabBar: UITabBar,DCPathButtonDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(publishButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // private 绝对私有，除了在当前类中可以访问之外，其他任何类或该类的扩展都不能访问到
    // fileprivate 文件私有，可以在当前类文件中访问，其他文件不能访问
    // open 在任何类文件中都能访问
    // internal 默认，也可以不写

    private lazy var publishButton: DCPathButton = {
        let publishButton = DCPathButton.init(center: UIImage(named: "feed_publish_44x44_"), hilightedImage: UIImage(named: "feed_publish_press_44x44_"))
        publishButton?.delegate = self
        let btn_Item1 = DCPathItemButton.init(image: UIImage(named: "chooser-moment-icon-music"), highlightedImage: UIImage(named: "chooser-moment-icon-music-highlighted"), backgroundImage: UIImage(named: "chooser-moment-button"), backgroundHighlightedImage: UIImage(named: "chooser-moment-button-highlighted"))
        
        let btn_Item2 = DCPathItemButton.init(image: UIImage(named: "chooser-moment-icon-place"), highlightedImage: UIImage(named: "chooser-moment-icon-place-highlighted"), backgroundImage: UIImage(named: "chooser-moment-button"), backgroundHighlightedImage: UIImage(named: "chooser-moment-button-highlighted"))
        
        let btn_Item3 = DCPathItemButton.init(image: UIImage(named: "chooser-moment-icon-camera"), highlightedImage: UIImage(named: "chooser-moment-icon-camera-highlighted"), backgroundImage: UIImage(named: "chooser-moment-button"), backgroundHighlightedImage: UIImage(named: "chooser-moment-button-highlighted"))
        
        let btn_Item4 = DCPathItemButton.init(image: UIImage(named: "chooser-moment-icon-thought"), highlightedImage: UIImage(named: "chooser-moment-icon-thought-highlighted"), backgroundImage: UIImage(named: "chooser-moment-button"), backgroundHighlightedImage: UIImage(named: "chooser-moment-button-highlighted"))
        
        let btn_Item5 = DCPathItemButton.init(image: UIImage(named: "chooser-moment-icon-sleep"), highlightedImage: UIImage(named: "chooser-moment-icon-sleep-highlighted"), backgroundImage: UIImage(named: "chooser-moment-button"), backgroundHighlightedImage: UIImage(named: "chooser-moment-button-highlighted"))
        
        publishButton?.addPathItems([btn_Item1, btn_Item2, btn_Item3, btn_Item4, btn_Item5])
        
        
        return publishButton!
    }()
    func itemButtonTapped(at index: UInt) {
        print("你点击了第 \(index) 个按钮")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        // 当前 tabbar 的宽度和高度
        let width = frame.width
        let height = frame.height

        publishButton.center = CGPoint(x: width * 0.5, y: height * 0.5 - 7)
        // 设置其他按钮的 frame
        let buttonW: CGFloat = width * 0.2
        let buttonH: CGFloat = height
        let buttonY: CGFloat = 0

        var index = 0

        for button in subviews {
            if !button.isKind(of: NSClassFromString("UITabBarButton")!) { continue }
            let buttonX = buttonW * (index > 1 ? CGFloat(index + 1) : CGFloat(index))
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            index += 1
            

        }
    }

    
}

extension MyTabBar{
    


}
