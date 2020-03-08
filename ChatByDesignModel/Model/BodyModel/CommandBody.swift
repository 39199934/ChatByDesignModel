//
//  CommandBody.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/1/31.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CommandBody: BodyProtocol{
    var type: String
    
    var sender: String
    
    var reciver: String
    
    var uuid: String
    
    var bag: JSON
    
    var commandName: String
    var commandType: String
    var commandDetail: JSON
    
    init(command_name: String,command_type: String,command_detail: JSON,sender s:String,reciver r: String){
        commandName = command_name
        commandType = command_type
        commandDetail = command_detail
        type = "command"
        bag = JSON()
        uuid = UUID().uuidString
        sender = s
        reciver = r
        setBag()
    }
    
    mutating func appendValueFromJson() {
        self.commandName = bag["commandName"].stringValue
        self.commandType = bag["commandType"].stringValue
        self.commandDetail = bag["commandDetail"]
        
    }
    
    mutating func appendJsonFromValue() {
        bag["commandName"].string = self.commandName
        bag["commandType"].string = self.commandType
        bag["commandDetail"] = self.commandDetail
    }
    
    
}
