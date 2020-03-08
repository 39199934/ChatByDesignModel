//
//  UserInfoProtocol.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/1/30.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol UserInfoProtocol: BagProtocol {
    var name: String{get set}
    var nickName: String{get set}
    //var uuid:String {get set}
    
    
}
extension UserInfoProtocol{
    mutating func setUserInfo(name: String,nick_name: String,uuid: String ){
        self.name = name;
        self.nickName = nick_name
        self.uuid = uuid
        self.setBag()
        
    }
   /* mutating func setUuid(){
        let uid = UUID()
        self.uuid = uid.uuidString
        self.setBag()
    }*/
    mutating func setValue() {
        self.name = bag["name"].stringValue
        self.nickName = bag["nickName"].stringValue
        self.uuid = bag["uuid"].stringValue
        appendValueFromJson()
    }
    mutating func setBag() {
        self.bag["name"].string = name
        self.bag["nickName"].string = nickName
        self.bag["uuid"].string = uuid
        self.appendJsonFromValue()
    }
    
}
