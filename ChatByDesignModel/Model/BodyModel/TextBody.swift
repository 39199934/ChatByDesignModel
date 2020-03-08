//
//  TextBody.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/1/30.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON

struct TextBody: BodyProtocol {
    var type: String = "text"
    
    var sender: String
    
    var reciver: String
    
    //var runBody: RunBody?
    
    var uuid: String = UUID().uuidString
    
    var bag: JSON = JSON()
    
    var text: String
    
    init(text msg: String,sender s: String,reciver r: String){
        text = msg
        sender = s
        reciver = r
        uuid = UUID().uuidString
        setBag()
        
        
    }
    
    mutating func appendValueFromJson() {
        self.text = bag["text"].stringValue
    }
    
    mutating func appendJsonFromValue() {
        bag["text"].string = self.text
    }
    

}
