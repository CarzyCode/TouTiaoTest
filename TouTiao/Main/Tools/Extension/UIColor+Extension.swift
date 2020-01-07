//
//  UIColor+Extension.swift
//  TouTiao
//
//  Created by Henry Li on 2019/12/12.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import Foundation

extension UIColor{
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat = 1.0) {
        self.init(displayP3Red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    class func globalBackgroundColor() -> UIColor {
        return UIColor.init(r: 248, g: 249, b: 247)
    }
}
