//
//  TestDataDatabase.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/3/6.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import CoreData
class TestDataDatabase: Database<TestData>{
   
    
    init(){
//        、、type = TestData.Type
        super.init(entityName: "test")
        delegate = nil
        
        
    }
    
    
}
