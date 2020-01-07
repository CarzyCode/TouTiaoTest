//
//  HeadIView.swift
//  TouTiao
//
//  Created by Henry Li on 2019/5/27.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import UIKit
import SnapKit

class HeadIView: UIView {

    override init(frame: CGRect) {
        super.init(frame:frame)
        self.addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViews() {
        let LoginBtn = UIButton()
        LoginBtn.backgroundColor = UIColor.red
        LoginBtn.layer.cornerRadius = 50
        LoginBtn.layer.masksToBounds = true
        LoginBtn.setTitle("登陆", for: UIControl.State.normal)
        LoginBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        LoginBtn.addTarget(self, action: #selector(LoginAction), for: UIControl.Event.touchUpInside)
        self.addSubview(LoginBtn)
        LoginBtn.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.center.equalTo(self.snp.center)
            
        }
        
    }
    
    @objc func LoginAction() {
        print("登陆")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
