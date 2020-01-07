//
//  NetworkTool.swift
//  TouTiao
//
//  Created by Henry Li on 2019/3/8.
//  Copyright © 2019 Henry Li. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import HandyJSON

protocol NetworkToolProctocol {
    
    //主页
    static func loadHomeNewsTitleData(completionHandler: @escaping (_ newsTitles: [HomeNewsTitle]) -> ())
    static func loadHomeData(completionHandler: @escaping (_ HomeItems: [HomeItem] , _ SildeModel: [slideModel]) -> ())
    //我的
    static func loadMineCellData(completionHandler: @escaping (_ MineCell:[[MyCellDataModel]]) ->())
    
    
}

extension NetworkToolProctocol{
    
    ///主页
    static func loadHomeData(completionHandler: @escaping (_ HomeItems: [HomeItem], _ SildeModel: [slideModel]) -> ()){
        let url = "http://console.juyun.tv/tools/list.json"
        Alamofire.request(url).responseJSON { (response) in
             guard response.result.isSuccess else {return}
            let data = JSON(response.result.value!)
            var titles = [HomeItem]()
            var photos = [slideModel]()
            if let datas = data["list"].arrayObject {
                for index in datas{
                    titles.append(HomeItem.deserialize(from: index as? Dictionary)!)
                }
                
            }
            if let datas = data["list_slide"].arrayObject {
                

                photos += datas.compactMap({
                    slideModel.deserialize(from: $0 as? NSDictionary)
                })
                
                
            }
            completionHandler(titles,photos)
            
        }
        
        
    }
    
    static func loadHomeNewsTitleData(completionHandler: @escaping (_ newsTitles: [HomeNewsTitle]) -> ()){
        let url  = "https://is.snssdk.com/article/category/get_subscribed/v1/?"
        let params = ["device_id": 6096495334,"iid": 5034850950]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {return}
            if let value = response.result.value {
                
                let json = JSON(value)
                guard json["message"] == "success" else { return }
                if let dataDict = json["data"].dictionary {
                    if let datas = dataDict["data"]?.arrayObject {
                        var titles = [HomeNewsTitle]()
                        titles.append(HomeNewsTitle.deserialize(from: "{\"category\": \"\", \"name\": \"推荐\"}")!)
                        for index in datas{
                            titles.append(HomeNewsTitle.deserialize(from: index as? Dictionary)!)
                        }
                        completionHandler(titles)
                    }
                }
            }
        }
    }
    
    
    
    ///我的
    static func loadMineCellData(completionHandler: @escaping (_ MineCell:[[MyCellDataModel]]) ->()){
        let url = BASE_URL + "/user/tab/tabs/?"
        let para = ["device_id": device_id]
        Alamofire.request(url, parameters: para).responseJSON { (response) in
            guard response.result.isSuccess else {
                ///网络错误
                print("网络出错")
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                
                var cellData1 = [[MyCellDataModel]]()
                
                guard json["message"] == "success" else {
                    return
                }
                if let data = json["data"].dictionary {
                    if let sections = data["sections"]?.array {
//                        var myCellModel = MyCellDataModel()
                       var cellData2 = [MyCellDataModel]()
                       cellData2.append(MyCellDataModel.deserialize(from: "{\"text\": \"我的关注\"}")!)
                        cellData1.append(cellData2)
                        for arr in sections {
                            var cellData = [MyCellDataModel]()
//                            cellData.append(MyCellDataModel.deserialize(from: "{\"text\": \"2333\"}")!)
                            for model in arr.arrayObject! {
                                    cellData.append(MyCellDataModel.deserialize(from: model as? Dictionary)!)
                                }
                            cellData1.append(cellData)
                        }
                        completionHandler(cellData1)
                        
//                        completionHandler(sections.compactMap({ item in
//                            (item as! [Any]).compactMap({ row in
//                                MyCellDataModel.deserialize(from: row as? NSDictionary)
//                            })
//                        }))
                    }
                    
                }
            }
            
        }
        
        
    }
}

func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
    
    let jsonData:Data = jsonString.data(using: .utf8)!
    
    let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
    if dict != nil {
        return dict as! NSDictionary
    }
    return NSDictionary()
    
}
func toolsChangeToJson(info: Any) -> String{
    //首先判断能不能转换
    guard JSONSerialization.isValidJSONObject(info) else {
        print("json转换失败")
        return ""
    }
    //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
    let jsonData = try? JSONSerialization.data(withJSONObject: info, options: [])
    
    if let jsonData = jsonData {
        let str = String(data: jsonData, encoding: String.Encoding.utf8)
        return str ?? ""
    }else {
        return ""
    }
}


struct NetworkTool: NetworkToolProctocol {}
