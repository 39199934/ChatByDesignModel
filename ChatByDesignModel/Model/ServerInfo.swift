//
//  ServerInfo.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/1/30.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ServerInfo: UserInfoProtocol {
   
    

    
    var name: String
    
    var nickName: String
    
    var uuid: String
    
    var bag: JSON
    
   
    init() {
        name = ""
        nickName = ""
        uuid = UUID().uuidString
        bag = JSON()
        //setUuid()
        self.setBag()
    }
    init(newname: String,nick: String){
        name = newname
        nickName = nick
        uuid = UUID().uuidString
        bag = JSON()
        self.setBag()
    }
   
    mutating func appendValueFromJson() {
        
    }
    
    mutating func appendJsonFromValue() {
        
    }
    mutating func setServerInfo(name: String,nick_name: String){
        self.name = name
        self.nickName = nick_name
        setBag()
    }
    
    
}
