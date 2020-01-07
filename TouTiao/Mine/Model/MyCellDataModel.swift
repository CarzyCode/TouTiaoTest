//
//  MyCellDataModel.swift
//  TouTiao
//
//  Created by Henry Li on 2019/12/16.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import Foundation
import HandyJSON

struct MyCellDataModel: HandyJSON {
    var grey_text: String = ""
      var text: String = ""
      var url: String = ""
      var key: String = ""
      var tip_new: Int = 0
}
