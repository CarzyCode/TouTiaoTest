//
//  HomeCellType2.swift
//  TouTiao
//
//  Created by Henry Li on 2019/6/12.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import UIKit

class HomeCellType2: UITableViewCell {

    func showAppInfoWithModel(model: HomeItem) {
        
        titleLable.text = model.title
        
        dateLabel.text = model.date
        
        imageView1.kf.setImage(with: URL(string: model.photo))
        
        imageView2.kf.setImage(with: URL(string: model.photo2))
        
        imageView3.kf.setImage(with: URL(string: model.photo3))
        
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        self.addSubview(titleLable)
        //        self.addSubview(dateLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var  titleLable : UILabel = {
        let titleLable = UILabel()
        titleLable.textColor = UIColor.black
        titleLable.numberOfLines = 0
        //        titleLable.text = "还将扩大好看啊的护肤科技啊阿水淀粉后看哈收到话费了啊水电费哈哈短发"
        self.addSubview(titleLable)
        titleLable.snp.makeConstraints({ (make) in
            make.width.equalTo(kScreenWidth-20)
            make.height.equalTo(30)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(0)
        })
        return titleLable
    }()
    
    lazy var imageView1 : UIImageView = {
        let imageView1 = UIImageView()
        imageView1.backgroundColor = UIColor.red
        self.addSubview(imageView1)
        imageView1.snp.makeConstraints({ (make) in
            make.width.equalTo(100)
            make.height.equalTo(80)
            make.left.equalTo(10)
            make.top.equalTo(self.titleLable.snp.bottom).offset(10)
        })
        return imageView1
    }()
    
    lazy var imageView2 : UIImageView = {
        let imageView2 = UIImageView()
        imageView2.backgroundColor = UIColor.red
        self.addSubview(imageView2)
        imageView2.snp.makeConstraints({ (make) in
            make.width.equalTo(self.imageView1)
            make.height.equalTo(self.imageView1)
            make.left.equalTo(self.imageView1.snp.right).offset(10)
            make.top.equalTo(self.imageView1.snp.top)
        })
        return imageView2
    }()
    
    lazy var imageView3 : UIImageView = {
        let imageView3 = UIImageView()
        imageView3.backgroundColor = UIColor.red
        self.addSubview(imageView3)
        imageView3.snp.makeConstraints({ (make) in
            make.width.equalTo(self.imageView2)
            make.height.equalTo(self.imageView2)
            make.left.equalTo(self.imageView2.snp.right).offset(10)
            make.top.equalTo(self.imageView1.snp.top)
        })
        return imageView3
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
