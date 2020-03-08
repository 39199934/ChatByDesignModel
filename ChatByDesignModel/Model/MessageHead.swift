//
//  MessageHead.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/1/30.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MessageHead: BagProtocol {
    var uuid: String = UUID().uuidString
    
    var bag: JSON = JSON()
    
    var version: String
    var size: Int
    init(version v: String,size ofBody: Int) {
        version = v
        size = ofBody
        setBag()
    }
    
    mutating func setValue() {
        self.uuid = bag["uuid"].stringValue
        self.version = bag["version"].stringValue
        self.size = bag["size"].intValue
        self.appendValueFromJson()
    }
    
    mutating func setBag() {
        bag["uuid"].string = self.uuid
        bag["version"].string = self.version
        bag["size"].int = self.size
        self.appendJsonFromValue()
    }
    
    func appendValueFromJson() {
        
    }
    
    func appendJsonFromValue() {
        
    }
    

}

