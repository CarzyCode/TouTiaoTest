//
//  HomeCell.swift
//  TouTiao
//
//  Created by Henry Li on 2019/6/12.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import UIKit
import SnapKit


class HomeCell: UITableViewCell {

    
    func showAppInfoWithModel(model: HomeItem) {
        
        titleLable.text = model.title
   
        dateLabel.text = model.date
       
        
        }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    lazy var  titleLable : UILabel = {
        let titleLable = UILabel()
        titleLable.textColor = UIColor.black
        titleLable.numberOfLines = 0
//        titleLable.text = "还将扩大好看啊的护肤科技啊阿水淀粉后看哈收到话费了啊水电费哈哈短发"
        self.addSubview(titleLable)
        titleLable.snp.makeConstraints({ (make) in
            make.width.equalTo(kScreenWidth-20)
            make.height.equalTo(60)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(0)
        })
        return titleLable
    }()
    lazy var  dateLabel : UILabel = {
        let dateLabel = UILabel()
        dateLabel.textColor = UIColor.gray
        dateLabel.text = "1天前"
        dateLabel.textAlignment = NSTextAlignment.right
        self.addSubview(dateLabel)
        dateLabel.snp.makeConstraints({ (make) in
            make.width.equalTo(100)
            make.height.equalTo(15)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        })
        return dateLabel
    }()
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
