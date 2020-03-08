//
//  TestData.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/3/6.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData
class TestData : BagProtocol{
//    required init(entity: String) {
//        self.entityName = entity
//        self.uuid = "uuid ----"
//
//        self.bag = JSON()
//        setBag()
//    }
    
//    var db: Database<TestData>
    init(uid: String){
        self.bag = JSON()
        self.uuid = uid
//        self.db = Database<TestData>(entityName: "test")
        
        setBag()
        
    }
    
    var uuid: String{
        didSet{
            self.setBag()
        }
    }
    
    var bag: JSON
    
    func setValue() {
        self.uuid = bag["uuid"].stringValue
        appendJsonFromValue()
    }
    
    func setBag() {
        bag["uuid"].string = self.uuid
        appendValueFromJson()
    }
    
    func appendValueFromJson() {
        
    }
    
    func appendJsonFromValue() {
        
    }
    
    
//    var entityName: String
    
  
    
    
}
