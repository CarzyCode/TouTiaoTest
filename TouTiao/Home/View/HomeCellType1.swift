//
//  HomeCellType1.swift
//  TouTiao
//
//  Created by Henry Li on 2019/6/12.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import UIKit
import Kingfisher

class HomeCellType1: UITableViewCell {

    func showAppInfoWithModel(model: HomeItem) {
        
        titleLable.text = model.title
        
        dateLabel.text = model.date
        
        imageView1.kf.setImage(with: URL(string: model.photo))
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        self.addSubview(titleLable)
        //        self.addSubview(dateLabel)
//        self.addSubview(imageView1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView1 : UIImageView = {
        let imageView1 = UIImageView()
        imageView1.backgroundColor = UIColor.red
        self.addSubview(imageView1)
        imageView1.snp.makeConstraints({ (make) in
            make.width.equalTo(100)
            make.height.equalTo(80)
            make.left.equalTo(10)
            make.top.equalTo(10)
        })
        return imageView1
    }()
    
    lazy var  titleLable : UILabel = {
        let titleLable = UILabel()
        titleLable.textColor = UIColor.black
        titleLable.numberOfLines = 0
        //        titleLable.text = "还将扩大好看啊的护肤科技啊阿水淀粉后看哈收到话费了啊水电费哈哈短发"
        self.addSubview(titleLable)
        titleLable.snp.makeConstraints({ (make) in
            make.right.equalTo(-10)
            make.height.equalTo(60)
            make.left.equalTo(self.imageView1.snp.right).offset(10)
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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
