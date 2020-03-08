//
//  BagProtocol.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/1/30.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON



protocol BagProtocol {
    var uuid: String{get set}
   
    var bag:JSON{get set}
    func toData() -> Data?
    
    //func setUuid()
    mutating func fromData(by data: Data) -> JSON?
    
    mutating func setValue() //用于基础类设置基本值 类似于模板方法 应添加append
    mutating func setBag() //用于基础类设置基本的JSON  类似于模板方法 应添加append
    mutating  func setUuid()
    
    mutating func appendValueFromJson() //用于子类设置扩展用的设置字段
    mutating func appendJsonFromValue() //用于子类设置扩展用的设置JSON
    
    //static func createSelf() -> BagProtocol
    
    
}
extension BagProtocol{
    //var uuid = UUID().uuidString
    var size:Int{
        get{
            if let data = toData(){
                return data.count
            }else{
                return 0
            }
        }
    }
    mutating  func setUuid(){
        let uid = UUID()
        self.uuid = uid.uuidString
        self.setBag()
    }
    func toData() -> Data?{
        do{
            let rtData = try self.bag.rawData()
            return rtData
            
        }catch{
            return nil
        }
    }
    mutating func fromData(by data: Data) -> JSON?{
        do{
            let json = try JSON(data: data)
            self.bag = json
            setValue()
            //return json
        }catch{
            print(error)
            return nil
        }
        return self.bag
    }
    mutating func fromJson(by json: JSON){
        self.bag = json
        self.setValue()
    }
    
 
    func getBag() -> JSON{
        return self.bag
    }
   
    func saveContent(to fileName: String) -> Bool {
        guard let data = toData() else{
            return false
        }
        do{
            try data.write(to: URL(fileURLWithPath: fileName))
        }catch{
            return false
        }
        //data.write(
        return true
    }
    mutating func loadContent(from fileName: String) ->Bool{
        do{
            let  data = try Data(contentsOf: URL(fileURLWithPath: fileName));
            let json = try JSON(data: data);
            fromJson(by: json)
        }catch{
            return false
        }
        return true
    }
    func getStoredKeys() -> [String]{
        var keys : [String] = []
        
        for j in self.bag{
            //let j = bag[i].dic dictionary!
            keys.append(j.0)
        }
        return keys
    }
    
}
