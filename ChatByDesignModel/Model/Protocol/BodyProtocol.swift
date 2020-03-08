//
//  BodyProtocol.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/1/30.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON
typealias RunBody = () -> Void
protocol BodyProtocol: BagProtocol {
    var type: String{get set}
    var sender: String{get set}
    var reciver: String{get set}
    //var runBody: RunBody?{get set}
    //func run()
      
}
extension BodyProtocol{
    mutating func setValue() {
        self.type = bag["type"].stringValue
        self.sender = bag["sender"].stringValue
        self.reciver = bag["reciver"].stringValue
        self.uuid = bag["uuid"].stringValue
        self.appendValueFromJson()
    }
    mutating func setBag() {
        bag["type"].string = self.type
        bag["sender"].string = self.sender
        bag["reciver"].string = self.reciver
        bag["uuid"].string = self.uuid
        self.appendJsonFromValue()
    }
    mutating func setBody(type: String,sender: String,reciver: String){
        self.type = type
        self.sender = sender
        self.reciver = reciver
        self.appendJsonFromValue()
    }
   /* mutating func setRunBody(runCode: @escaping RunBody){
        self.runBody = runCode
    }*/
   
}
