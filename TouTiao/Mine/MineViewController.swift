//
//  ViewController.swift
//  TouTiao
//
//  Created by Henry Li on 2019/2/18.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import UIKit
import SnapKit

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width

//let tableView = UITableView()


class MineViewController: UIViewController {
//    var sectionArr =
    var cellDataArr = [[MyCellDataModel]]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.addHeadView()
        
    }
    func addHeadView() {
        let head = HeadIView()
        head.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight/4)
        head.backgroundColor = UIColor.yellow
//        self.view.addSubview(head)
        let tableView = UITableView()
        tableView.tableHeaderView = head
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(kScreenHeight)
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(0)
        }
        NetworkTool.loadMineCellData { (section) in
//            let jsonString = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
//            let myConcern = MyCellDataModel.deserialize(from: jsonString)
//            var myConcerns = [MyCellDataModel]()
//            myConcerns.append(myConcern!)
//            self.cellDataArr.append(myConcerns)
            self.cellDataArr = section
            tableView.reloadData()
//             self.cellDataArr += section
//            tableView.reloadData()
        }
        
    }

}


extension MineViewController :UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.cellDataArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard section > 1 else {
//            return 2
//        }
//        return 3
        return self.cellDataArr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        var myCellModel = MyCellDataModel()
        myCellModel = self.cellDataArr[indexPath.section][indexPath.row]
        cell.textLabel?.text = myCellModel.text
        return cell
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.frame = CGRect.init(x: 0, y: 10, width: kScreenWidth, height: kScreenHeight)
        header.backgroundColor = UIColor.globalBackgroundColor()
        return header
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section > 0 else {
            return 0.01
        }
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}
