//
//  TestViewController.swift
//  TouTiao
//
//  Created by Henry Li on 2019/3/27.
//  Copyright © 2019 Henry Li. All rights reserved.
//



import UIKit


class TestViewController: UIViewController, UIGestureRecognizerDelegate {
    var UrlStr:String = ""
    
    let headView = UIView()
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
//        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
//        [self.navigationController.interactivePopGestureRecognizer setValue:@([UIScreen mainScreen].bounds.size.width) forKeyPath:@"_recognizer._settings._edgeSettings._edgeRegionSize"];
//        self.navigationController?.interactivePopGestureRecognizer?.setValue(<#T##value: Any?##Any?#>, forKeyPath: <#T##String#>)
//        self.navigationController?.interactivePopGestureRecognizer?.setValue(kScreenWidth, forKeyPath: "_recognizer._settings._edgeSettings._edgeRegionSize")
        
        
    }
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if self.navigationController?.viewControllers.count == 1{
//            return false;
//        }
//        return true;
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headView.backgroundColor = UIColor.yellow;
        self.view.addSubview(headView)
        headView.snp.makeConstraints { (make) in
            make.left.top.equalTo(0)
            make.height.equalTo(64)
            make.width.equalTo(kScreenWidth)
        }

        let LoginBtn = UIButton()
        LoginBtn.backgroundColor = UIColor.clear
        LoginBtn.setTitle("首页", for: UIControl.State.normal)
        LoginBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        LoginBtn.addTarget(self, action: #selector(LoginAction), for: UIControl.Event.touchUpInside)
        headView.addSubview(LoginBtn)
        LoginBtn.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.left.equalTo(20)
            make.top.equalTo(20)

        }
        self.title = "测试"
        self.view.backgroundColor = UIColor.yellow
        // Do any additional setup after loading the view.
//        _recognizer._settings._edgeSettings._edgeRegionSize
    }
    

    @objc func LoginAction(){
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
