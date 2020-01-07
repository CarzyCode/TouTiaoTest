//
//  ViewController.swift
//  TouTiao
//
//  Created by Henry Li on 2019/2/18.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import UIKit


class HuoshanViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    fileprivate lazy var myTableView: UITableView = {
        let myTableView = UITableView()
        self.view.addSubview(myTableView)
        myTableView.snp.makeConstraints({ (make) in
            make.left.top.equalTo(0)
            make.height.equalTo(kScreenHeight)
            make.width.equalTo(kScreenWidth)
    
        })
        return myTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cell"
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        return cell!

    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel()
        header.backgroundColor = UIColor.red
        header.frame = CGRect(x: 20, y: 10, width: 100, height: 20)
        header.text = "哈哈"
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

