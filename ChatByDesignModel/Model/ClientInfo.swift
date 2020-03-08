//
//  ClientInfo.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/1/30.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON
struct ClientInfo: UserInfoProtocol{
    
    
    var name: String
    
    var nickName: String
    
    var uuid: String
    
    var bag: JSON
    var password : String
    
    
    init() {
        name = ""
        nickName = ""
        password = ""
        uuid = UUID().uuidString
        bag = JSON()
        self.setBag()
    }
    init(newname: String,nick: String,pass_word: String){
        name = newname
        nickName = nick
        password = pass_word
        uuid = UUID().uuidString
        bag = JSON()
        self.setBag()
    }
    init(newname: String,nick: String,pass_word: String,new_uuid: String){
        name = newname
        nickName = nick
        password = pass_word
        uuid = new_uuid
        bag = JSON()
        self.setBag()
    }
    
    mutating func appendValueFromJson() {
        self.password = bag["password"].stringValue
    }
    
    mutating func appendJsonFromValue() {
        self.bag["password"].string = self.password
    }
    
    mutating func setClientInfo(newname: String,nick: String,pass_word: String){
        self.name = newname
        self.nickName = nick
        self.password = pass_word
        //uuid = UUID().uuidString
        //bag = JSON()
        self.setBag()
    }
    
    
}
