//
//  ViewController.swift
//  TouTiao
//
//  Created by Henry Li on 2019/2/18.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import UIKit
import SGPagingView
import SnapKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,WRCycleScrollViewDelegate {

    let screenWidth = UIScreen.main.bounds.width
    /// 屏幕的高度
    let screenHeight = UIScreen.main.bounds.height
    
    var itemArr = [HomeItem]()
    var slideArr = [slideModel]()
    
    
    lazy var cycleScrollView:WRCycleScrollView = {
        let frame = CGRect(x: 0, y: 0, width: CGFloat(kScreenWidth), height: 240)
        let cycleView = WRCycleScrollView(frame: frame, type: .LOCAL, imgs: nil, descs: nil)
        return cycleView
    }()

    fileprivate lazy var myTableView : UITableView = {
        let myTableView = UITableView()
        self.view.addSubview(myTableView)
        myTableView.snp.makeConstraints({ (make) in
            make.left.top.equalTo(0)
            make.height.equalTo(screenHeight)
            make.width.equalTo(screenWidth)
            
        })
        var localImages = [String]()
        var descs = [String]()
        for index in slideArr {
            let slideM : slideModel = index
            localImages.append(slideM.photo)
            descs.append(slideM.title)
        }
       
        
        cycleScrollView.serverImgArray = localImages
        cycleScrollView.descTextArray = descs
        cycleScrollView.delegate = self
        myTableView.addSubview(cycleScrollView)
        return myTableView
    }()
   
    //MARK: 轮播图点击事件
    func cycleScrollViewDidSelect(at index: Int, cycleScrollView: WRCycleScrollView) {
        let testVC = TestViewController()
        let sildeM : slideModel = self.slideArr[index]
        testVC.UrlStr = sildeM.contentUrl
        
        
        self.navigationController?.pushViewController(testVC, animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("========================================")
        print(GetCurrentDevice.getCurrentDeviceModel())
        
        NetworkTool.loadHomeData { (arrayList,arrayList1) in
            self.itemArr = arrayList
            self.slideArr = arrayList1
            self.myTableView.delegate = self
            self.myTableView.dataSource = self
            
            
        }

    }
    

    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel: HomeItem = itemArr[indexPath.row]
        
        if cellModel.doc_type == "0" {
            let cellid = "testCellID"
            var cell:HomeCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? HomeCell
            if cell==nil {
                cell = HomeCell(style: .subtitle, reuseIdentifier: cellid)
            }
            cell?.selectionStyle = .none
            cell?.showAppInfoWithModel(model: cellModel)
            return cell!
        }else if cellModel.doc_type == "1" {
            let cellid = "testCellID1"
            var cell:HomeCellType1? = tableView.dequeueReusableCell(withIdentifier: cellid) as? HomeCellType1
            if cell==nil {
                cell = HomeCellType1(style: .subtitle, reuseIdentifier: cellid)
            }
            
             cell?.selectionStyle = .none
            cell?.showAppInfoWithModel(model: cellModel)
            return cell!
        }else{
            let cellid = "testCellID2"
            var cell:HomeCellType2? = tableView.dequeueReusableCell(withIdentifier: cellid) as? HomeCellType2
            if cell==nil {
                cell = HomeCellType2(style: .subtitle, reuseIdentifier: cellid)
            }
            
             cell?.selectionStyle = .none
            cell?.showAppInfoWithModel(model: cellModel)
            return cell!
        }
        
        
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellModel: HomeItem = itemArr[indexPath.row]
        if cellModel.doc_type == "2" {
            return 150
        }else {
            return 100
        }
        
    }

}




